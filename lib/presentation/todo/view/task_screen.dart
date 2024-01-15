import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_application/presentation/todo/blocs/switch_bloc/switch_bloc.dart';
import 'package:flutter_web_application/presentation/todo/blocs/task_bloc/task_bloc.dart';
import 'package:flutter_web_application/presentation/todo/model/task_model.dart';
import 'package:flutter_web_application/presentation/todo/view/add_task_screen.dart';
import 'package:flutter_web_application/presentation/todo/view/edit_task_screen.dart';
import 'package:flutter_web_application/presentation/todo/view/recycle_bin_screen.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});
  static const id = 'tasks_screen';
  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    final list = ['1st Trimester', '2nd Trimester', '3rd Trimester'];
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> taskList = state.allTasks;
        return Scaffold(
            appBar: AppBar(
              foregroundColor: Colors.white,
              backgroundColor: Colors.deepPurple,
              title: const Text(
                'My Task',
                style: TextStyle(color: Colors.white),
              ),
            ),
            drawer: Drawer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    color: Colors.deepPurple.shade200,
                    child: Center(
                      child: Text('Task Drawer',
                          style: Theme.of(context).textTheme.titleMedium),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        ListTile(
                            onTap: () {
                              Navigator.of(context).pushNamed(TaskScreen.id);
                            },
                            leading: const Icon(Icons.folder_special),
                            title: const Text('My Task'),
                            trailing: Text('${state.allTasks.length}')),
                        const Divider(),
                        ListTile(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(RecycleBinScreen.id);
                            },
                            leading: const Icon(Icons.delete_forever),
                            title: const Text('Recycle Bin'),
                            trailing: Text('${state.removedTask.length}')),
                        const Divider(),
                        BlocBuilder<SwitchBloc, SwitchState>(
                          builder: (context, state) {
                            return Center(
                              child: Switch(
                                  value: state.switchValue,
                                  onChanged: (value) {
                                    value
                                        ? BlocProvider.of<SwitchBloc>(context)
                                            .add(SwitchOnEvent())
                                        : BlocProvider.of<SwitchBloc>(context)
                                            .add(SwitchOffEvent());
                                  }),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(onPressed: () {
              addTask();
            }),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Chip(label: Text('${taskList.length} : Task')),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: taskList.length,
                      itemBuilder: (ctx, index) {
                        var task = taskList[index];
                        return ListTile(
                          onTap: () {
                            // addTask(task.task);
                          },
                          title: Text(
                            taskList[index].task,
                            style: TextStyle(
                                decoration: taskList[index].isDone == true
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none),
                          ),
                          leading: IconButton(
                              onPressed: () {
                                editTask(task);
                              },
                              icon: const Icon(Icons.edit)),
                          onLongPress: () {
                            if (task.isDeleted!) {
                              BlocProvider.of<TaskBloc>(context)
                                  .add(DeleteTaskEvent(task: task));
                            } else {
                              BlocProvider.of<TaskBloc>(context)
                                  .add(RemoveTaskEvent(task: task));
                            }
                          },
                          trailing: Checkbox(
                              value: task.isDone,
                              onChanged: (val) {
                                BlocProvider.of<TaskBloc>(context)
                                    .add(UpdateTaskEvent(task: task));
                              }),
                        );
                      }),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xff21215d)),
                    child: Center(
                      child: DropdownButton(
                          dropdownColor: Color(0xff21215d),
                          borderRadius: BorderRadius.circular(15),
                          focusColor: Color(0xff21215d),
                          isDense: true,
                          alignment: Alignment.center,
                          icon: Icon(
                            Icons.check_circle_outline,
                            color: Colors.green,
                          ),
                          hint: Text('1st Trimester'),
                          items: <String>[
                            '1st Trimester',
                            '2nd Trimester',
                            '3rd Trimester',
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Padding(
                                padding: EdgeInsets.only(right: 20),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 20),
                                      child: Text(
                                        value,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    Icon(
                                      Icons.check_circle_outline,
                                      color: Colors.green,
                                    )
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (val) {}),
                    ),
                  )
                ],
              ),
            ));
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

  void editTask(Task task) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: EditTaskScreen(oldTask: task),
            ),
          );
        });
  }
}
