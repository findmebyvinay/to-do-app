import 'package:flutter/material.dart';
import 'package:to_do_app/util/mybutton.dart';
class Dialogbox extends StatelessWidget {
  final controller;
  VoidCallback onsave;
  VoidCallback onCancel;
   Dialogbox({super.key,
   required this.controller,
   required this.onsave,
   required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Icon(Icons.coffee,size: 30,color: Colors.brown,),
      //backgroundColor: Colors.purpleAccent[300],
      content: Container(
        height: 150,
    //   color: Colors.purpleAccent[400],
       child: Column(
          children: [
            TextField(  
              controller: controller,           
              decoration: InputDecoration(
               border: OutlineInputBorder(),
               hintText: "add a TO DO"
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                SizedBox(width: 20,),
                   Mybutton(text:"save",
             onPressed:(){
              onsave();
             }
             ),
             const SizedBox(width: 40,),
             Mybutton(text: "Cancel",
              onPressed:(){
              onCancel();
              })
              ],
            ),
           
          ],
        ),
      ),
    );
  }
}