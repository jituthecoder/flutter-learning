import 'package:hive/hive.dart';

class ToDoDatabase {

  List toDoList = [];
  //  Reference our box
  final _myBox = Hive.box("mybox");

  // Run this methord if this is the 1st time ever opening this app
  void createInitialDate(){
    List toDoList = [
      ["Make Tutorial", false,],
      ["Do Exercise", false,]
    ];
  }

  // Load the data from database

  void loadData(){
    toDoList = _myBox.get("TODOLIST");
  }

  // Update the database

  void updateDataBase(){
    _myBox.put("TODOLIST", toDoList);
  }
}