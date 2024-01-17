import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_application/presentation/form_validation/validation_mixin/validation_mixin.dart';

import '../form_validation_bloc/form_validation_bloc.dart';

class LoginScreen extends StatelessWidget with ValidationMixin {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Form Validation'),
      ),
      body: BlocBuilder<FormValidationBloc, FormValidationState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: BlocProvider.of<FormValidationBloc>(context).formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: BlocProvider.of<FormValidationBloc>(context).email,
                    validator: validateEmail,
                    decoration:
                        const InputDecoration(hintText: 'Please enter email'),
                  ),
                  const SizedBox(height: 40),
                  TextFormField(
                    controller: BlocProvider.of<FormValidationBloc>(context).password,
                    validator: validatePassword,
                    decoration:
                        const InputDecoration(hintText: 'Please enter password'),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(onPressed: () {
                    BlocProvider.of<FormValidationBloc>(context).add(OnSubmitEvent(
                      email: BlocProvider.of<FormValidationBloc>(context).email.text, 
                      password: BlocProvider.of<FormValidationBloc>(context).password.text,
                      successMsg: 'You are successfully logged in....'));
                  }, 
                  child: const Text('Submit')),
                  const SizedBox(height: 40),
                  state is OnSubmitState ? 
                  Text(state.successMsg):
                  const SizedBox(),
                  // BlocSelector<FormValidationBloc, FormValidationState,String>(
                  //   selector: (FormValidationState state)=> , 
                  //   builder: builder)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
