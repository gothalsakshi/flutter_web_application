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

class EditTaskEvent extends TaskEvent{
  final Task task;

  const EditTaskEvent({required this.task});
}