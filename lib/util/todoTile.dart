import 'package:flutter/material.dart';
class Todotile extends StatelessWidget {
  final String taskname;
  final bool taskcompleted;
  Function(bool?)?onchanged;
 Todotile({super.key,required this.onchanged,
 required this.taskname,
 required this.taskcompleted});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),

      child:Container(
      
         padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Checkbox(value:taskcompleted, onChanged:onchanged),
            Text(taskname,
            style:TextStyle(fontSize: 20,
              decoration: taskcompleted ? TextDecoration.lineThrough: TextDecoration.none ,)),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 183, 66, 167),
        ),
      ),
    );
  }
}
