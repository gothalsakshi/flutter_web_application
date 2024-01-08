import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_web_application/presentation/todo/model/task_model.dart';
part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent,TaskState>{
  TaskBloc() : super(const TaskState()){

    on<AddTaskEvent>((event,emit){
      final state = this.state;
      emit(TaskState(allTasks: List.from(state.allTasks)..add(event.task)));
    });

    on<UpdateTaskEvent>((event,emit){
      final state = this.state;
      final task = event.task;

      List<Task> allTask = List.from(state.allTasks)..remove(task);
      task.isDone == false ?
      allTask.add(task.copyWith(isDone: true)) :
      allTask.add(task.copyWith(isDone: false));
      emit(TaskState(allTasks: allTask));
    });

    on<DeleteTaskEvent>((event,emit){
      final state = this.state;
      emit(TaskState(allTasks: List.from(state.allTasks)..add(event.task)));
    });
  }
}