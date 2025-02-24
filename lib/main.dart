import 'package:e_commerce/core/MyBlocObserver.dart';
import 'package:e_commerce/core/di/di.dart';
import 'package:e_commerce/core/shared_preference_utils.dart';
import 'package:e_commerce/core/utils/app_theme.dart';
import 'package:e_commerce/home.dart';
import 'package:e_commerce/ui/auth/login/login_screen.dart';
import 'package:e_commerce/ui/home_tab/widget/cart_item_count_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'ui/favorite_tab/cubit/wishlist_viewmodel.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceUtils.init();
  configureDependencies();

  Bloc.observer = MyBlocObserver();
  runApp(MultiBlocProvider(
            providers: [
  BlocProvider<CartItemCountCubit>(create: (BuildContext context) => CartItemCountCubit()),
  BlocProvider<WishlistViewmodel>(create: (BuildContext context) => getIt<WishlistViewmodel>())

      ],
      child: const MyApp()));
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
