// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'task_bloc.dart';



class TaskState extends Equatable {
  final List<Task> allTasks;
  final List<Task> removedTask;
  const TaskState({
    this.allTasks = const <Task>[],
    this.removedTask = const <Task>[]
  });
  @override
  List<Object> get props => [allTasks, removedTask];
  

  TaskState copyWith({
    List<Task>? allTasks,
    List<Task>? removedTask,
  }) {
    return TaskState(
      allTasks: allTasks ?? this.allTasks,
      removedTask: removedTask ?? this.removedTask,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'allTasks': allTasks.map((x) => x.toMap()).toList(),
      'removedTask': removedTask.map((x) => x.toMap()).toList(),
    };
  }

  factory TaskState.fromMap(Map<String, dynamic> map) {
    return TaskState(
      allTasks: List<Task>.from((map['allTasks'] as List<int>).map<Task>((x) => Task.fromMap(x as Map<String,dynamic>),),),
      removedTask: List<Task>.from((map['removedTask'] as List<int>).map<Task>((x) => Task.fromMap(x as Map<String,dynamic>),),),
    );
  }
}

class ChangeThemeState extends TaskState{
  final bool theme;
  const ChangeThemeState({required this.theme});

}

// class UpdateTaskState extends TaskState{
//   final Task task;
//   const UpdateTaskState({required this.task});

//   @override
//   List<Object?> get props => [task];
// }

// class DeleteTaskState extends TaskState{
//   final Task task;
//   const DeleteTaskState({required this.task});

//   @override
//   List<Object?> get props => [task];
// }

// class RemoveTaskState extends TaskState{
//   final Task task;
//   const RemoveTaskState({required this.task});

//   @override
//   List<Object?> get props => [task];
// }

// class EditTaskState extends TaskState{
//   final Task task;

//   const EditTaskState({super.allTasks, required this.task});
// }
