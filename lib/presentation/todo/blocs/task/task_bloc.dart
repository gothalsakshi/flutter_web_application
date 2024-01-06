import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_application/presentation/todo/model/task_model.dart';
part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  List<TaskModel> taskList = [];
  List<TaskModel> completedTaskList = [];
  TextEditingController task = TextEditingController();
  TaskBloc() : super(TaskInitial()) {
    on<AddTaskEvent>((event, emit) {
      taskList.add(TaskModel(task: event.task, isCompleted: false));
      emit(AddTaskState(addingTask : TaskModel(task: task.text,isCompleted: false)));
      if(taskList.isNotEmpty){
        emit(AddedTaskState(taskAddedLst: taskList));
      }
    });

    on<UpdateListItemEvent>((event, emit){
      taskList[event.index].isCompleted  = ! taskList[event.index].isCompleted;
      taskList.removeAt(event.index);
      
      emit(DeleteTaskState(list: taskList));
      emit(UpdateListItemState(completedTaskList));
      emit(AddedTaskState(taskAddedLst: taskList));
      
      // if(event.updateTaskModel.isCompleted == false){
      //   emit(UpdateListItemState(TaskModel(task: task.text, isCompleted: true)));
      // }else{
      //   emit(UpdateListItemState(TaskModel(task: task.text, isCompleted: false)));
      // }
      
    });

    on<DeleteTaskEvent>((event, emit){
      taskList.removeAt(event.selectedIndex);  
      debugPrint("calling remove function--->${taskList.length} ");
      emit(DeleteTaskState(list: taskList));
      // emit(UpdateListItemState(taskList)); 
    }); 

    on<CompletedTasKEvent>((event, emit){
      completedTaskList.add(TaskModel(task: taskList[event.index].task, isCompleted: taskList[event.index].isCompleted));
      emit(CompletedTaskState(completedTaskList,event.index));
    });
  }

  @override
  void onChange(Change<TaskState> change) {
    super.onChange(change);
    debugPrint("on change called-->$change");
  }
}
