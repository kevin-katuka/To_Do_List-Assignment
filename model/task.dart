import 'package:flutter/material.dart';

enum TaskCategory {
  study, coding, praying, tutorial, mrBarkaClass,
}

class Task {
  String todo;
  bool done;
  TaskCategory category;

  Task(this.todo, this.done, this.category);
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TaskList());
  }
}

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<Task> tasks = [
    Task('Study math', false, TaskCategory.study),
    Task('Code Flutter', false, TaskCategory.coding),
    Task('Pray', true, TaskCategory.praying),
    Task('Watch tutorial', false, TaskCategory.tutorial),
    Task('Mr Barka class', false, TaskCategory.mrBarkaClass),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tasks')),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, i) {
          return ListTile(
            title: Text(tasks[i].todo),
            leading: Icon(tasks[i].done ? Icons.check : Icons.circle_outlined),
            trailing: Text(tasks[i].category.name.toUpperCase()),
            onTap: () => setState(() => tasks[i].done = !tasks[i].done),
          );
        },
      ),
    );
  }
}
