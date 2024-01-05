import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/task/task_bloc.dart';


class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskBloc = TaskBloc();
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("List of TODOs"),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: taskBloc.task,
                ),
                const SizedBox(height: 40),
                ElevatedButton(onPressed: () {
                  BlocProvider.of<TaskBloc>(context).add(AddTaskEvent(taskBloc.task.text));
                  Navigator.pop(context);
                }, child: const Text("Submit"))
              ],
            ),
          ),
        );
      },
    );
  }
}