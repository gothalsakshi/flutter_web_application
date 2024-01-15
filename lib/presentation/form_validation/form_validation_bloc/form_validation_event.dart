part of 'form_validation_bloc.dart';

sealed class FormValidationEvent extends Equatable {
  const FormValidationEvent();

  @override
  List<Object> get props => [];
}


class OnSubmitEvent extends FormValidationEvent{
  final String email;
  final String password;
  final String successMsg;

  const OnSubmitEvent({required this.email, required this.password,required this.successMsg});
}
