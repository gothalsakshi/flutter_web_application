import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_application/presentation/todo/blocs/task/task_bloc.dart';
import 'package:flutter_web_application/presentation/todo/model/task_model.dart';
import 'package:flutter_web_application/presentation/todo/view/add_task_screen.dart';

import '../blocs/navigation_bar_bloc/navigation_bar_bloc.dart';

class ShowListScreen extends StatelessWidget {
  const ShowListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BlocBuilder<NavigationBarBloc, NavigationBarState>(
            builder: (context, state) {
              return BottomNavigationBar(
                  onTap: (int tappedIndex) {
                    BlocProvider.of<NavigationBarBloc>(context).add(ChangedNavigationBarEvent());
                  },
                  currentIndex: BlocProvider.of<NavigationBarBloc>(context).currentIndex,
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.padding), label: "Pending Task"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.check_box), label: "Completed Task")
                  ]);
            },
          ),
          appBar: AppBar(
            title: const Text("List of Tasks"),
          ),
          floatingActionButton: FloatingActionButton(onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (ctx) => const AddTaskScreen()));
          }),
          body: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: state is AddedTaskState
                  ? ListView.builder(
                      itemCount: state.taskAddedLst.length,
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
                              value: state.taskAddedLst[index].isCompleted,
                              onChanged: (val) {
                                debugPrint("value of val--->${val.toString()}");
                                // if(state is UpdateListItemState){
                                BlocProvider.of<TaskBloc>(context).add(
                                    UpdateListItemEvent(
                                        updateTaskModel: TaskModel(
                                            task:
                                                state.taskAddedLst[index].task,
                                            isCompleted: val!),
                                        index: index));
                                // }
                                // state.taskAddedLst[index].isCompleted  != state.taskAddedLst[index].isCompleted;
                                debugPrint(
                                    'list item bool--->${state.taskAddedLst[index].isCompleted}');
                              }),
                          title: Text(state.taskAddedLst[index].task),
                        );
                      })
                  : state is UpdateListItemState
                      ? ListView.builder(
                          itemCount: state.taskModel.length,
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
                                  value: state.taskModel[index].isCompleted,
                                  onChanged: (val) {
                                    debugPrint(
                                        "value of val--->${val.toString()}");
                                    // if(state is UpdateListItemState){
                                    BlocProvider.of<TaskBloc>(context).add(
                                        UpdateListItemEvent(
                                            updateTaskModel: TaskModel(
                                                task:
                                                    state.taskModel[index].task,
                                                isCompleted: val!),
                                            index: index));
                                    // }
                                    // state.taskAddedLst[index].isCompleted  != state.taskAddedLst[index].isCompleted;
                                    debugPrint(
                                        'list item bool--->${state.taskModel[index].isCompleted}');
                                  }),
                              title: Text(state.taskModel[index].task),
                            );
                          })
                      : const Center(
                          child: Text("No More Task"),
                        )),
        );
      },
    );
  }
}
