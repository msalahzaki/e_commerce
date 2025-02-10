import 'package:e_commerce/core/di/di.dart';
import 'package:e_commerce/core/utils/custom_dailog.dart';
import 'package:e_commerce/ui/auth/register/cubit/register_states.dart';
import 'package:e_commerce/ui/auth/register/cubit/register_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/app_styles.dart';

class Register extends StatelessWidget {
   Register({super.key});
final RegisterViewmodel viewmodel =getIt<RegisterViewmodel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColor.primary,),
      backgroundColor: AppColor.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocListener(
              bloc: viewmodel,
              listener: (context, state) {
                if(state is RegisterLoadingState){
                  return CustomDailog.showLoading(context);
                }
                if(state is RegisterErrorState){
                   CustomDailog.hideLoading(context);
                  return CustomDailog.showAwesomeErrorMessageDialog(context: context, massage: state.errorMassage);
                }  if(state is RegisterLoadingState){
                  CustomDailog.hideLoading(context);
                  return CustomDailog.showAwesomeErrorMessageDialog(context: context, massage: "Register Successfull");
                }
            },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Image.asset(
                      AppAssets.routeLogo,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 70.h,
                  ),
                  /// full Name
                  Text(
                    "Full Name",
                    style: AppStyles.normal18white,
                  ),
                  SizedBox(
                    height:15.h,
                  ),
                  TextFormField(
                    controller: viewmodel.nameController,
                    decoration: const InputDecoration(hintText: "enter Your Full Name"),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  /// Mobile Number
                  Text(
                    "Mobile Number",
                    style: AppStyles.normal18white,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  TextFormField(
                    controller: viewmodel.phoneController,
                    decoration: const InputDecoration(hintText: "enter Your Mobile Number"),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                      /// Email Address
                  Text(
                    "E-mail Address",
                    style: AppStyles.normal18white,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  TextFormField(
                    controller: viewmodel.emailController,
                    decoration: const InputDecoration(hintText: "enter Email"),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    "Password",
                    style: AppStyles.normal18white,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  TextFormField(
                    controller: viewmodel.passwordController,
                    decoration: const InputDecoration(hintText: "enter Your Password",suffixIcon: Icon(Icons.visibility)),
                  ),

                  SizedBox(
                    height: 40.h,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        viewmodel.register();
                      },
                      child: Text(
                        "Sign Up",
                        style: AppStyles.bold20primary,
                      )),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
