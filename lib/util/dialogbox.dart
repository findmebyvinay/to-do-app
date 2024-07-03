import 'package:flutter/material.dart';
class Dialogbox extends StatelessWidget {
  const Dialogbox({super.key});

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
              decoration: InputDecoration(
               border: OutlineInputBorder(),
               hintText: "add a TO DO"
              ),
            )
          ],
        ),
      ),
    );
  }
}