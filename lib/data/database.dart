import 'package:hive/hive.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TodoDataBase{
 List todoList=[];

  final _mybox = Hive.box('mybox');

  //init first time
  void createinitialData(){
    todoList = [['study',false],
    ['do exercice',false]];
  }
  //load the data from database
  void loaddata(){
    todoList = _mybox.get('TODOLIST');
  }
  //update the database
  void updatedatabase(){
    _mybox.put('TODOLIST', todoList);
  }

}