import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_application/presentation/todo/model/task_model.dart';
import '../blocs/task_bloc/task_bloc.dart';

class EditTaskScreen extends StatelessWidget {
  final Task oldTask;
  const EditTaskScreen({super.key, required this.oldTask});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController(text: oldTask.task);
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: controller,
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel')),
                ElevatedButton(
                    onPressed: () {
                      var task = Task(task: controller.text);
                      BlocProvider.of<TaskBloc>(context)
                                    .add(EditTaskEvent(oldTask: oldTask,newTask: task));
                      controller.clear();
                      Navigator.pop(context);
                    },
                    child: const Text("Save")),
              ],
            ),
            SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
