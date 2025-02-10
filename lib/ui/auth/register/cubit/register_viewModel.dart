import 'package:e_commerce/domain/usecases/register_useCase.dart';
import 'package:e_commerce/ui/auth/register/cubit/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterViewmodel extends Cubit<RegisterStates>{
  RegisterUseCase registerUseCase;
  RegisterViewmodel(this.registerUseCase):super(RegisterInitialState());
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  register() async{
    emit(RegisterLoadingState());
    var either =  await registerUseCase.invoke(nameController.text, phoneController.text, emailController.text, passwordController.text);
    either.fold((error){
      emit(RegisterErrorState(error.errorMessage));
    }, (success){
      emit(RegisterSuccessState(success));
    });
  }



}