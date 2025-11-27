import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/bloc_observer.dart';
import 'config/di.dart';
import 'core/utils/app_routes.dart';
import 'features/ui/auth/login/login_screen.dart';
import 'features/ui/auth/register/register_screen.dart';
import 'features/ui/pages/home_screen/home_screen.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize:  Size( 430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child){
        return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.homeRoute,
        routes: {
          AppRoutes.homeRoute: (context) => HomeScreen(),
          AppRoutes.loginRoute: (context) => LoginScreen(),
           AppRoutes.registerRoute: (context) => RegisterScreen(),
        //   AppRoutes.homeRoute: (context) =>  HomeScreen()
         },
        theme: AppTheme.lightTheme
        );
          }
    );
  }


}