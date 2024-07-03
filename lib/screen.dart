import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_app/util/todoTile.dart';

import 'util/dialogbox.dart';


class Screen extends StatefulWidget {
  const Screen({super.key});
 
  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  List toDoList=[
    ["exercise",true],
    ["study",false],
    ["write note",true]
  ];

  void checkBoxChanged(bool ? value, int index){
   setState(() {
     toDoList[index][1] = ! toDoList[index][1];
   });
  }
  void newTask(){
     showDialog(
      context: context,
     builder: (context){
      return Dialogbox();
     });
  }
  @override


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color.fromARGB(255, 218, 108, 174),
        title: Text("TO DO APP",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color:Colors.white,
             ),
        ),
      ),
   body:ListView.builder(
    itemCount: toDoList.length,
    itemBuilder: (context, index) {
      return Todotile(onchanged:(value)=>
        checkBoxChanged(value, index)
      ,
       taskname: toDoList[index][0],
        taskcompleted:toDoList[index][1]);
    },
   ),
   floatingActionButton:FloatingActionButton(
    onPressed:(){
      newTask();
    },
    child:Icon(Icons.add) ,),
   ); 
  }
}