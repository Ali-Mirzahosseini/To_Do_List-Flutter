import 'package:flutter/material.dart';
import 'format_text.dart';

class TaskContainer extends StatelessWidget {
  final String taskText;
  final Function? checkboxCallback;
  final Function? longPressCallback;
  TaskContainer(this.taskText,
      {super.key,
      this.isChecked,
      this.checkboxCallback,
      this.longPressCallback});
  bool? isChecked;

  @override
  Widget build(BuildContext context) {
    double taskTextHeight = 50.0;
    if (taskText.length > 25 && taskText.length <= 50){
      // taskText = taskText.split(pattern)
      taskTextHeight = 100.0;
    } else if (taskText.length > 50) {
      taskTextHeight = 150.0;
    }
    return GestureDetector(
      onLongPress: (){
        longPressCallback!();
      },
      child: Container(
        width: 300.0,
        height: taskTextHeight,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          color: Color.fromRGBO(240, 240, 240, 1.0),
        ),
        margin: const EdgeInsets.only(
            left: 20.0, top: 12.0, right: 20.0, bottom: 12.0),
        child: Row(
          children: [
            Checkbox(
              activeColor: const Color.fromRGBO(148, 102, 198, 1.0),
              shape: const CircleBorder(),
              value: isChecked,
              onChanged: (value) {
                checkboxCallback!();
              },
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                formatTaskText(taskText),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  decoration: isChecked!
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
