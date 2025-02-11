import 'package:e_commerce/domain/usecases/login_useCase.dart';
import 'package:e_commerce/ui/auth/login/cubit/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';



@injectable
class LoginViewmodel extends Cubit<LoginStates>{
  LoginUseCase loginUseCase;
  LoginViewmodel(this.loginUseCase):super(LoginInitialState());
  final emailController = TextEditingController(text: "msalahz@gmail.com");
  final passwordController = TextEditingController(text: "msalahz@gmail.com");
  var formKey = GlobalKey<FormState>();
  login() async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoadingState());
      var either = await loginUseCase.invoke(
          emailController.text, passwordController.text);
      either.fold((error) {
        emit(LoginErrorState(error.errorMessage));
      }, (success) {
        emit(LoginSuccessState(success));
      });
    }
  }


}