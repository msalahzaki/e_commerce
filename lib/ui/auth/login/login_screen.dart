import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/ui/auth/register/register.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                "User Name",
                style: AppStyles.normal18white,
              ),
              SizedBox(
                height: 24.h,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "enter user name"),
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
                  onPressed: () {},
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
    );
  }
}
