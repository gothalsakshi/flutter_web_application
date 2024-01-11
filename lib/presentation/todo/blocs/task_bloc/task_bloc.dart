import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_web_application/presentation/todo/model/task_model.dart';
part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
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

    // on<EditTaskEvent>((event, emit){
    //   final state = this.state;
    //   emit(TaskState(allTasks: List.from(state.allTasks)..);
    // });

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
}