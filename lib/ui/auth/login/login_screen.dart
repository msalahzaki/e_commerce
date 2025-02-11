import 'package:e_commerce/core/di/di.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/core/utils/custom_dailog.dart';
import 'package:e_commerce/core/utils/validator.dart';
import 'package:e_commerce/home.dart';
import 'package:e_commerce/ui/auth/login/cubit/login_states.dart';
import 'package:e_commerce/ui/auth/login/cubit/login_viewModel.dart';
import 'package:e_commerce/ui/auth/register/register.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
final LoginViewmodel loginViewmodel = getIt<LoginViewmodel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocListener<LoginViewmodel,LoginStates>(
            bloc: loginViewmodel,
            listener: (BuildContext context, LoginStates state) {
              if(state is LoginLoadingState){
                return CustomDailog.showLoading(context);
              }
              if(state is LoginErrorState){
                CustomDailog.hideLoading(context);
                return CustomDailog.showAwesomeErrorMessageDialog(context: context, massage: state.errorMassage);
              }  if(state is LoginSuccessState){
                CustomDailog.hideLoading(context);
                return CustomDailog.showAwesomeSuccessMessageDialog(context: context, massage: "Register Successfull",okFunction: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home(),));
                });
              }
            },
            child: Form(
              key: loginViewmodel.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Image.asset(
                      AppAssets.routeLogo,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 87.h,
                  ),
                  Text(
                    "Welcome Back To Route",
                    style: AppStyles.bold24white,
                  ),
                  Text(
                    "Please sign in with your mail",
                    style: AppStyles.normal16white,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Text(
                    "E-Mail",
                    style: AppStyles.normal18white,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  TextFormField(
                    controller: loginViewmodel.emailController,
                    validator:Validator.validateEmail ,
                    decoration: InputDecoration(hintText: "enter E-mail Adrress"),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Text(
                    "Password",
                    style: AppStyles.normal18white,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  TextFormField(
                    controller: loginViewmodel.passwordController,
                    //validator: Validator.validatePassword,
                    decoration: InputDecoration(hintText: "enter Your Password"),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forget Password",
                      style: AppStyles.normal18white,
                    ),
                  ),
                  SizedBox(
                    height: 56.h,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        loginViewmodel.login();
                      },
                      child: Text(
                        "Login",
                        style: AppStyles.bold20primary,
                      )),
                  SizedBox(height: 24.h),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Register(),));
                      },
                      child: Text(
                        "Don’t have an account? Create Account",
                        style: AppStyles.normal18white,
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
