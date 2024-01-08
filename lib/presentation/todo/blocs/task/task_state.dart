part of 'task_bloc.dart';

class TaskState extends Equatable{
  final List<Task> allTasks;
  const TaskState({
    this.allTasks = const <Task>[]
  });
  @override
  List<Object?> get props => [allTasks];
}

class AddTaskState extends TaskState{
  final Task task;
  const AddTaskState({required this.task});

  @override
  List<Object?> get props => [task];
}

class UpdateTaskState extends TaskState{
  final Task task;
  const UpdateTaskState({required this.task});

  @override
  List<Object?> get props => [task];
}

class DeleteTaskState extends TaskState{
  final Task task;
  const DeleteTaskState({required this.task});

  @override
  List<Object?> get props => [task];
}
