import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_application/presentation/todo/model/task_model.dart';
import '../blocs/task/task_bloc.dart';

class AddTaskScreen extends StatelessWidget {
  
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Container(
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
                          .add(AddTaskEvent(task: task));
                      controller.clear();
                      Navigator.pop(context);
                    },
                    child: const Text("Submit")),
              ],
            ),
            SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}
