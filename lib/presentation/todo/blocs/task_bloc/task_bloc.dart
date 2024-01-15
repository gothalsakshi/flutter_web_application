// import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_web_application/presentation/todo/model/task_model.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    bool theme = false;
    on<AddTaskEvent>((event, emit) {
      final state = this.state;
      emit(
        TaskState(
            allTasks: List.from(state.allTasks)..add(event.task),
            removedTask: state.removedTask),
      );
    });

    on<UpdateTaskEvent>((event, emit) {
      final state = this.state;
      final task = event.task;

      List<Task> allTask = List.from(state.allTasks)..remove(task);
      task.isDone == false
          ? allTask.add(task.copyWith(isDone: true))
          : allTask.add(task.copyWith(isDone: false));
      emit(TaskState(allTasks: allTask, removedTask: state.removedTask));
    });

    on<DeleteTaskEvent>((event, emit) {
      final state = this.state;
      emit(TaskState(allTasks: state.allTasks,
      removedTask: List.from(state.removedTask)..remove(event.task)));
    });

    on<EditTaskEvent>((event, emit){
      final state = this.state;
      emit(TaskState(
        allTasks: List.from(state.allTasks)..remove(event.oldTask)..insert(0, event.newTask),
        removedTask: List.from(state.removedTask)));
    });

    on<RemoveTaskEvent>((event, emit) {
      final state = this.state;
      emit(TaskState(
          allTasks: List.from(state.allTasks)..remove(event.task),
          removedTask: List.from(state.removedTask)
            ..add(event.task.copyWith(isDeleted: true))));
    });

    on<ChangeThemeEvent>((event, emit) {
      theme != theme;
      emit(ChangeThemeState(theme: theme));
    });
  }
  
  @override
  TaskState? fromJson(Map<String, dynamic> json) {
    return TaskState.fromMap(json);
  }
  
  @override
  Map<String, dynamic>? toJson(TaskState state) {
    return state.toMap();
  }
}
