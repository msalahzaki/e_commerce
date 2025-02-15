import 'package:e_commerce/core/MyBlocObserver.dart';
import 'package:e_commerce/core/di/di.dart';
import 'package:e_commerce/core/utils/app_theme.dart';
import 'package:e_commerce/home.dart';
import 'package:e_commerce/ui/auth/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932), // Set your design reference size
      builder: (context, child) {
        return MaterialApp(
          theme: AppTheme.lightTheme,
          themeMode: ThemeMode.light,
          home:  LoginScreen(),
        );
      },
    );

  }
}
