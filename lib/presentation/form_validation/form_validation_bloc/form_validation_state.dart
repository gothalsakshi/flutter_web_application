part of 'form_validation_bloc.dart';

sealed class FormValidationState extends Equatable {
  const FormValidationState();
  
  @override
  List<Object> get props => [];
}

final class FormValidationInitial extends FormValidationState {}

final class OnSubmitState extends FormValidationState{
  final String email;
  final String password;
  final String successMsg;

  const OnSubmitState({required this.email, required this.password,required this.successMsg});
}
