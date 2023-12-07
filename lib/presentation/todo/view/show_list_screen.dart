import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_application/presentation/todo/blocs/bloc/task_bloc.dart';
import 'package:flutter_web_application/presentation/todo/model/task_model.dart';
import 'package:flutter_web_application/presentation/todo/view/add_task_screen.dart';

class ShowListScreen extends StatelessWidget {
  const ShowListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("List of Tasks"),
          ),
          floatingActionButton: FloatingActionButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (ctx)=> const AddTaskScreen()));
          }),
          body: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: state is AddedTaskState ? ListView.builder(
              itemCount: state.taskAddedLst.length,
              itemBuilder: (ctx,index){
                return ListTile(
                  // tileColor: Colors.amber,
                  leading: Checkbox(value: state.taskAddedLst[index].isCompleted,
                  onChanged: (val){
                    debugPrint("value of val--->${val.toString()}");
                    // if(state is UpdateListItemState){
                      BlocProvider.of<TaskBloc>(context).add(UpdateListItemEvent(updateTaskModel: TaskModel(task: state.taskAddedLst[index].task,isCompleted: val!),index: index));
                    // }
                    // state.taskAddedLst[index].isCompleted  != state.taskAddedLst[index].isCompleted;
                  debugPrint('list item bool--->${state.taskAddedLst[index].isCompleted}');
                  }),
                  title: Text(state.taskAddedLst[index].task),
                );
            }) : const Center(
              child: Text("There is no any Task"),
            )
          ),
        );
      },
    );
  }
}
