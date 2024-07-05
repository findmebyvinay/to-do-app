import 'package:flutter/material.dart';
class Mybutton extends StatelessWidget {
  String text;
  VoidCallback onPressed;
  Mybutton({super.key,required this.text,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed:onPressed,
  color: Colors.purpleAccent,
    child:Text(text));
  }
}