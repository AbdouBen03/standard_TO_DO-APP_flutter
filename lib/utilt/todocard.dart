import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class TodoCard extends StatelessWidget {
  final String taskName;
  final bool complete;
  final Function(bool?)? onChanged;
  Function(BuildContext)? deletefunc;
  TodoCard(
      {super.key,
      required this.taskName,
      required this.complete,
      required this.onChanged,required this.deletefunc});
  

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
        child: Slidable(
          endActionPane:ActionPane(motion: StretchMotion(), children:[
            SlidableAction(onPressed:deletefunc,
            
            icon:Icons.delete,
            backgroundColor:Colors.red.shade800,
            borderRadius: BorderRadius.circular(12),
            ),
          ]) ,
          child: Container(
            padding: EdgeInsets.all(24),
            height: 100,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 163, 83, 77),
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                //checkbox
                Checkbox(value: complete, onChanged: onChanged,activeColor: Colors.pink,),
          
                Text(taskName,
                    style: TextStyle(decoration: complete ? TextDecoration.lineThrough : TextDecoration.none)),
              ],
            ),
          ),
        ),
      );
  }
}
