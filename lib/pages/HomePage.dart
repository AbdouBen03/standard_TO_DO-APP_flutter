import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/database.dart';
import 'package:flutter_application_1/utilt/dialogBox.dart';
import 'package:flutter_application_1/utilt/todocard.dart';
import 'package:hive/hive.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _mybox = Hive.box('myBox');
  TodoDataBase db = TodoDataBase();
 final _controller = TextEditingController();
 @override
  void initState() {
    // if is the first time ever to open 
    if(_mybox.get('TODOLIST')==null){
      db.createinitialData();
    }else{
     db.loaddata();
    }
    super.initState();
  }
 
 
 
  void checkboxchekd(bool? value, int index){
    setState(() {
      db.todoList[index][1] = ! db.todoList[index][1];
    });
    db.updatedatabase();

  }
  void saveNewtask(){
    setState(() {
      db.todoList.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updatedatabase();
  }
  void createNewTask(){
     showDialog(
          context: context,
          builder: (context) {
            return DialogBox(conteroller: _controller, onSave: saveNewtask, onCancel: () =>Navigator.of(context).pop() ,);
          },
        );
        
  }
  void deleTask(int index){
    setState(() {
     db.todoList.removeAt(index);
     
    });
    db.updatedatabase();
  }
  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
          backgroundColor: Colors.pink[200],
          appBar: AppBar(
            actions: [Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('(made by abdou)',style: TextStyle(color: const Color.fromARGB(255, 90, 9, 105),fontSize: 12),),
            )],
            backgroundColor: Colors.red[500],
            centerTitle: true,
            title: Text('to do'),
            elevation: 0,
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor:Colors.red[500] ,
            onPressed: createNewTask,
            child: Icon(Icons.add,color:Colors.black ),),
          body: ListView.builder(
            itemCount: db.todoList.length,
            itemBuilder: (context, index) {
              return TodoCard(
                taskName: db.todoList[index][0],
                complete: db.todoList[index][1],
                onChanged: (value) =>checkboxchekd(value,index) ,
                deletefunc: (context) => deleTask(index) ,
              );
            },
            
          )),
    );
  }
}
