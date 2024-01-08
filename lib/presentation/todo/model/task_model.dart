
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Task extends Equatable{
  final String task;
  bool? isDone;
  bool? isDeleted;
  Task({
    required this.task,
    this.isDone,
    this.isDeleted,
  }){
    isDone =  isDone ?? false;
    isDeleted = isDeleted ?? false;
  }


  Task copyWith({
    String? task,
    bool? isDone,
    bool? isDeleted,
  }) {
    return Task(
      task: task ?? this.task,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'task': task,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      task: map['task'] as String,
      isDone: map['isDone'] != null ? map['isDone'] as bool : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
    );
  }
  
  @override
  List<Object?> get props => [
    task,isDone,isDeleted
  ];

}
