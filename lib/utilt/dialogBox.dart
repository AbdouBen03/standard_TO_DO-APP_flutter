import 'package:flutter/material.dart';
// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  
   DialogBox({super.key, this.conteroller,required this.onCancel,required this.onSave});
  final conteroller ;
  VoidCallback onSave;
  VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.red[200],
            title: const Text('what to do?'),
            content: TextFormField(
              controller: conteroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Add a new task',
              ),
            ),
            actions: [
              ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red[900]) ),
                  onPressed: onSave,
                  child: const Text('save',style: TextStyle(color: Colors.black),)),
              ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red[900]) ),
                  onPressed:onCancel,
                  child:  const Text('cancel',style: TextStyle(color:Colors.black),))
            ],
          );
  }
}