part of 'task_bloc.dart';

@immutable
sealed class TaskState {}

final class TaskInitial extends TaskState {}

final class AddTaskState extends TaskState{
  final TaskModel addingTask;

  AddTaskState({required this.addingTask});
}

final class DeleteTaskState extends TaskState{
  final List<TaskModel> list;

  DeleteTaskState({required this.list});
}

final class AddedTaskState extends TaskState{
  final List<TaskModel> taskAddedLst;

  AddedTaskState({required this.taskAddedLst}); 
}

final class UpdateListItemState extends TaskState{
  final List<TaskModel> taskModel;

  UpdateListItemState(this.taskModel);
}
