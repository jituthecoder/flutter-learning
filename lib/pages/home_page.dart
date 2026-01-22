import "dart:ffi";

import "package:flutter/material.dart";
import "package:flutter_application_1/data/database.dart";
import "package:flutter_application_1/pages/utils/dialog_box.dart";
import "package:flutter_application_1/pages/utils/todo_tile.dart";
import "package:hive/hive.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // Reference the hive box

  final _myBox = Hive.box("mybox");
  ToDoDatabase db = ToDoDatabase();
  
  @override
  void initState() {
    
    //  If this is the 1st time opening the app, then create default data
    if(_myBox.get("TODOLIST") == null){
      db.createInitialDate();
    } else{
      // There already exists data
      db.loadData();
    }
    super.initState();
  }
  // Text Controller

  final myContoller = TextEditingController();

  // list of todo tasks
  // List toDoList = [
  //   ["Make Tutorial", false,],
  //   ["Do Exercise", false,]
  // ];

  //  Checkbox was tapped
  void checkBoxChanged(bool? value, int index){
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  void saveNewTask(){
    setState(() {
      db.toDoList.add([myContoller.text, false]);
      myContoller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();

  }

  void deleteTask(int index ){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
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
    db.updateDataBase();
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
      itemCount: db.toDoList.length,
      itemBuilder: (context, index){
        return TodoTile(
          taskName: db.toDoList[index][0], 
          taskCommpleted: db.toDoList[index][1], 
          onChanged: (value) => checkBoxChanged(value, index),
          deleteFunction: (context)=> deleteTask(index),
        );
      }
      ),
	);
  }
}