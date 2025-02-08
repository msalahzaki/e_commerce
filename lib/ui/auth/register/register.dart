import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/app_styles.dart';

class Register extends StatelessWidget {
   Register({super.key});
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();
  final phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: SafeArea(
        child: SingleChildScrollView(
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
                  decoration: const InputDecoration(hintText: "enter user name"),
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
                  decoration: const InputDecoration(hintText: "enter Your Password",suffixIcon: Icon(Icons.visibility)),
                ),
              
                SizedBox(
                  height: 40.h,
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Sign Up",
                      style: AppStyles.bold20primary,
                    )),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
