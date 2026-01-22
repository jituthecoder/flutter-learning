import "package:flutter/material.dart";
import "package:flutter_application_1/pages/home_page.dart";
import "package:flutter_application_1/pages/todo_page.dart";
import "package:hive/hive.dart";
import "package:hive_flutter/adapters.dart";

void main() async {
  // iinit the hive

  await Hive.initFlutter();

  // Open a box

  var box = await Hive.openBox("mybox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.yellow)
    );
  }
}