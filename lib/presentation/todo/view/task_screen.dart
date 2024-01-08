import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_application/presentation/todo/blocs/task/task_bloc.dart';
import 'package:flutter_web_application/presentation/todo/model/task_model.dart';
import 'package:flutter_web_application/presentation/todo/view/add_task_screen.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> taskList = state.allTasks;
        return Scaffold(
            floatingActionButton: FloatingActionButton(onPressed: () {
              addTask();
            }),
            body: ListView.builder(
                itemCount: taskList.length,
                itemBuilder: (ctx, index) {
                  var task = taskList[index];
                  return ListTile(
                    title: Text(taskList[index].task),
                    trailing: Checkbox(
                        value: task.isDone, 
                        onChanged: (val) {
                          BlocProvider.of<TaskBloc>(context)
                          .add(UpdateTaskEvent(task: task));
                        }),
                  );
                }));
      },
    );
  }

  void addTask() {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: const AddTaskScreen(),
            ),
          );
        });
  }
}
