import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key});
  String newTaskText = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.0,
      color: const Color.fromRGBO(117, 117, 117, 1.0),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.0),
            topRight: Radius.circular(32.0),
          ),
          color: Colors.white,
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text('Add Task',
                  style: TextStyle(
                      color: Color.fromRGBO(16, 24, 65, 1.0),
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold)),
            ),
             Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
              child: Consumer<TaskData>(
                builder: (context, taskText, child){
                  return TextField(
                    onChanged: (value){
                      newTaskText = value;
                    },
                    style: const TextStyle(fontSize: 18.0),
                    autofocus: true,
                    decoration: const InputDecoration(
                        constraints:
                        BoxConstraints(maxHeight: 100.0, maxWidth: 330.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        )),
                  );
                }

              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    backgroundColor: const Color.fromRGBO(16, 24, 65, 1.0),
                    fixedSize: const Size(330.0, 30.0)),
                onPressed: () {
                  Provider.of<TaskData>(context, listen: false).addTask(newTaskText);
                  Navigator.pop(context);
                },
                child: const Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
