// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'task_bloc.dart';

@immutable
sealed class TaskEvent {}

class AddTaskEvent extends TaskEvent{
  final String task;

  AddTaskEvent(this.task);
}

class DeleteTaskEvent extends TaskEvent{}

class AddedTaskEvent extends TaskEvent{
  final List<TaskModel> taskAddedLst;

  AddedTaskEvent({required this.taskAddedLst});
}

class UpdateListItemEvent extends TaskEvent {
  final TaskModel updateTaskModel;
  final int index;
  UpdateListItemEvent({
    required this.updateTaskModel,
    required this.index
  });


}
