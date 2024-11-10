import 'package:flutter/material.dart';
import 'package:to_do_list/task_list.dart';
import 'package:to_do_list/screens/add_task_screen.dart';
import 'package:intl/intl.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE, d MMMM').format(now);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(16, 24, 65, 1.0),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(16, 24, 65, 1.0),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTaskScreen(),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 40.0,
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(16, 24, 65, 1.0),
            ),
            height: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 32.0, top: 64.0, bottom: 48.0),
                  child: Text(
                    "LET'S BE \nPRODUCTIVE \nTODAY",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.date_range_rounded,
                        size: 20.0,
                        color: Color.fromRGBO(148, 102, 198, 1.0),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        formattedDate,
                        style: const TextStyle(fontSize: 14.0),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 503,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32.0),
                topRight: Radius.circular(32.0),
              ),
              color: Colors.white,
            ),
            child: const TaskList(),
          ),
        ],
      ),
    );
  }
}
