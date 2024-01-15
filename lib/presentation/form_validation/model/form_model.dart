// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class FormModel extends Equatable {
  final String? email;
  final String? password;

  const FormModel(
    this.email,
    this.password,
  );
  
  @override
  List<Object?> get props => [email,password];

  FormModel copyWith({
    String? email,
    String? password,
  }) {
    return FormModel(
      email ?? this.email,
      password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory FormModel.fromMap(Map<String, dynamic> map) {
    return FormModel(
      map['email'] as String,
      map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FormModel.fromJson(String source) => FormModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
