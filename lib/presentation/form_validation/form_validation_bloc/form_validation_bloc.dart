import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'form_validation_event.dart';
part 'form_validation_state.dart';

class FormValidationBloc extends Bloc<FormValidationEvent, FormValidationState> {
  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  FormValidationBloc() : super(FormValidationInitial()) {
    on<OnSubmitEvent>((event, emit) {
      if(formKey.currentState!.validate()){
        emit(OnSubmitState(email: event.email,password: event.password,successMsg: 'You are successfully logged in....'));
      }
    });
  }
}
