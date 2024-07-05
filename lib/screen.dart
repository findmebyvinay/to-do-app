import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/database.dart';
import 'package:to_do_app/util/todoTile.dart';

import 'util/dialogbox.dart';


class Screen extends StatefulWidget {
  
  const Screen({super.key});
 
  @override
  State<Screen> createState() => _ScreenState();
}
 
class _ScreenState extends State<Screen> {
  var _mybox = Hive.box("myBox"); 
 final _controller= TextEditingController();
 @override
 
 void initState(){

  if(_mybox.get("TODOLIST")== null){
    Db.createInitialData();
  }
  else{
  Db.loadData();
  }
 }

  ToDoDatabase Db =ToDoDatabase();
  void checkBoxChanged(bool ? value, int index){
   setState(() {
     Db.toDoList[index][1] = ! Db.toDoList[index][1];
   });
   Db.updateDatabase();
  }
  void newSavedTask(){
  setState(() {
    Db.toDoList.add([_controller.text,false]);
  });
  Navigator.of(context).pop();
  Db.updateDatabase();
  }
  void newTask(){
     showDialog(
      context: context,
     builder: (context){
      return Dialogbox(
        controller:_controller,
        onsave: newSavedTask,
        onCancel: Navigator.of(context).pop,
      );
     });
  }
  //delete to-do task
  void deleteTask(int index){
    setState(() {
      Db.toDoList.removeAt(index);
    });
   Db.updateDatabase(); 
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
    itemCount: Db.toDoList.length,
    itemBuilder: (context, index) {
      return Todotile(onchanged:(value)=>
        checkBoxChanged(value, index)
      ,
       taskname: Db.toDoList[index][0],
        taskcompleted:Db.toDoList[index][1],
        deleteFunction:(context)=>deleteTask(index),
        );
        
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