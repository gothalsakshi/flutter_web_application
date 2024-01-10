import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_application/presentation/todo/blocs/task/task_bloc.dart';
import 'package:flutter_web_application/presentation/todo/model/task_model.dart';
import 'package:flutter_web_application/presentation/todo/view/add_task_screen.dart';
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
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> taskList = state.allTasks;
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepPurple,
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
                          onTap: (){
                            Navigator.of(context).pushNamed(TaskScreen.id);
                          },
                            leading: const Icon(Icons.folder_special),
                            title: const Text('My Task'),
                            trailing: const Text('0')),
                        const Divider(),
                        ListTile(
                          onTap:(){
                            Navigator.of(context).pushNamed(RecycleBinScreen.id);
                          } ,
                          leading: const Icon(Icons.delete_forever),
                          title: const Text('Recycle Bin'),
                          trailing: const Text('0')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(onPressed: () {
              addTask();
            }),
            body: Column(
              children: [
                Chip(label: Text('${taskList.length} : Task')),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: taskList.length,
                    itemBuilder: (ctx, index) {
                      var task = taskList[index];
                      return ListTile(
                        onTap: () {
                          addTask();
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
                              BlocProvider.of<TaskBloc>(context)
                                  .add(DeleteTaskEvent(task: task));
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
}
