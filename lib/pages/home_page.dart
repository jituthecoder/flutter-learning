import "dart:ffi";

import "package:flutter/material.dart";
import "package:flutter_application_1/pages/utils/dialog_box.dart";
import "package:flutter_application_1/pages/utils/todo_tile.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // Text Controller

  final myContoller = TextEditingController();

  // list of todo tasks
  List toDoList = [
    ["Make Tutorial", false,],
    ["Do Exercise", false,]
  ];

  //  Checkbox was tapped
  void checkBoxChanged(bool? value, int index){
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void saveNewTask(){
    setState(() {
      toDoList.add([myContoller.text, false]);
      myContoller.clear();
    });

  }

  void deleteTask(int index ){
    setState(() {
      toDoList.removeAt(index);
    });
  }

  // Create a new task
  void createNewTask(){
    showDialog(context: context, builder: (content){
      return DialogBox(
        controller: myContoller,
        onSave:  saveNewTask,
        onCancel: ()=> Navigator.of(context).pop(),
        
      ); 
    });
  }


  @override
  Widget build(BuildContext context) {
	return Scaffold(
		backgroundColor: Colors.yellow[200],
		appBar: AppBar(
			backgroundColor: Colors.yellow,
      title: Center(child: Text("TO DO"),),
      elevation: 0,
		),
    floatingActionButton: FloatingActionButton(
      onPressed: createNewTask,
      child: Icon(Icons.add),
    ),
    body: ListView.builder(
      itemCount: toDoList.length,
      itemBuilder: (context, index){
        return TodoTile(
          taskName: toDoList[index][0], 
          taskCommpleted: toDoList[index][1], 
          onChanged: (value) => checkBoxChanged(value, index),
          deleteFunction: (context)=> deleteTask(index),
        );
      }
      ),
	);
  }
}