import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_application/presentation/todo/model/task_model.dart';
import '../blocs/task/task_bloc.dart';

class CompletedTaskScreen extends StatelessWidget {
  const CompletedTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          
          if (state is CompletedTaskState) {
            // BlocProvider.of<TaskBloc>(context).add(CompletedTasKEvent(index: state.index,completedTaskList: state.completedTaskList));
            return ListView.builder(
                itemCount: state.completedTaskList.length,
                itemBuilder: (ctx, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    trailing: InkWell(
                        onTap: () {
                          BlocProvider.of<TaskBloc>(context)
                              .add(DeleteTaskEvent(index));
                        },
                        child: const Icon(Icons.delete)),
                    // tileColor: Colors.amber,
                    leading: Checkbox(
                        value: state.completedTaskList[index].isCompleted,
                        onChanged: (val) {
                          debugPrint("value of val--->${val.toString()}");
                          // if(state is UpdateListItemState){
                          BlocProvider.of<TaskBloc>(context).add(
                              UpdateListItemEvent(
                                  updateTaskModel: TaskModel(
                                      task: state.completedTaskList[index].task,
                                      isCompleted: val!),
                                  index: index));
                          // }
                          // state.taskAddedLst[index].isCompleted  != state.taskAddedLst[index].isCompleted;
                          debugPrint(
                              'list item bool--->${state.completedTaskList[index].isCompleted}');
                        }),
                    title: Text(state.completedTaskList[index].task),
                  );
                });
          } else {
            return const Center(child: Text('No More task.......'));
          }
        },
      ),
    );
  }
}
