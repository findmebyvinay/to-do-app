import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'screen.dart';

void main()async {

  await Hive.initFlutter();

  var box=await Hive.openBox("myBox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Screen(),
      debugShowCheckedModeBanner:false ,
      theme: ThemeData(primarySwatch:Colors.lightBlue ),
    );
    }}