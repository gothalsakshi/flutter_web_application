// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable{
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class AddTaskEvent extends TaskEvent{
  final Task task;
  const AddTaskEvent({required this.task});

  @override
  List<Object> get props => [task];
}

class UpdateTaskEvent extends TaskEvent{
  final Task task;
  const UpdateTaskEvent({required this.task});

  @override
  List<Object> get props => [task];
}

class DeleteTaskEvent extends TaskEvent{
  final Task task;
  const DeleteTaskEvent({required this.task});

  @override
  List<Object> get props => [task];
}

class RemoveTaskEvent extends TaskEvent{
  final Task task;
  const RemoveTaskEvent({required this.task});

  @override
  List<Object> get props => [task];
}

class EditTaskEvent extends TaskEvent{
  final Task oldTask;
  final Task newTask;

  const EditTaskEvent({required this.oldTask, required this.newTask});

   @override
  List<Object> get props => [oldTask,newTask];
}

class ChangeThemeEvent extends TaskEvent{
  final bool theme;

  const ChangeThemeEvent({required this.theme});
}