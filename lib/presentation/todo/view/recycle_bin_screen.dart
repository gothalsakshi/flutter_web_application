import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_application/presentation/todo/blocs/task_bloc/task_bloc.dart';
import 'package:flutter_web_application/presentation/todo/model/task_model.dart';

class RecycleBinScreen extends StatelessWidget {
  const RecycleBinScreen({super.key});
  static const id = 'recycle_bin_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'Recycle bin',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          List<Task> taskList = state.removedTask;
          return Column(
            children: [
              Chip(label: Text('${taskList.length} : Task')),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: taskList.length,
                  itemBuilder: (ctx, index) {
                    var task = taskList[index];
                    return ListTile(
                      onTap: () {},
                      title: Text(
                        taskList[index].task,
                        style: TextStyle(
                            decoration: taskList[index].isDone == true
                                ? TextDecoration.lineThrough
                                : TextDecoration.none),
                      ),
                      leading: IconButton(
                          onPressed: () {
                            BlocProvider.of<TaskBloc>(context)
                                .add(EditTaskEvent(task: task));
                          },
                          icon: const Icon(Icons.edit)),
                      onLongPress: () {
                        BlocProvider.of<TaskBloc>(context)
                            .add(DeleteTaskEvent(task: task));
                      },
                      trailing: Checkbox(
                          value: task.isDone,
                          onChanged: (val) {
                            BlocProvider.of<TaskBloc>(context)
                                .add(UpdateTaskEvent(task: task));
                          }),
                    );
                  }),
            ],
          );
        },
      ),
    );
  }
}
