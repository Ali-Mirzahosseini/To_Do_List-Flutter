import 'package:flutter/material.dart';
import 'package:to_do_list/task_data.dart';
import 'screens/task_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(TodayDo());
}

class TodayDo extends StatelessWidget {
  TodayDo({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        home: const TaskScreen(),
        theme: ThemeData(textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),),
      ),
    );
  }
}

