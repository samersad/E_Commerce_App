import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/cache/shared_prefs_helper.dart';
import 'package:e_commerce_app/core/utils/app_theme.dart';
import 'package:e_commerce_app/features/ui/pages/cart_screen/cart_screen.dart';
import 'package:e_commerce_app/features/ui/pages/cart_screen/cubit/cart_screen_view_model.dart';
import 'package:e_commerce_app/features/ui/pages/tabs/product_tab/product_details/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/bloc_observer.dart';
import 'config/di.dart';
import 'core/utils/app_routes.dart';
import 'features/ui/auth/login/login_screen.dart';
import 'features/ui/auth/register/register_screen.dart';
import 'features/ui/pages/home_screen/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await SharedPrefsHelper.init();
  configureDependencies();
  String routeName;
  var token= SharedPrefsHelper.getData(key: "token");
  if (token==null) {
    routeName=AppRoutes.loginRoute;
  }
  else{
    routeName=AppRoutes.homeRoute;
  }
  runApp( MultiBlocProvider(providers: [
    BlocProvider(create: (context) => getIt<CartScreenViewModel>(),)
  ],
      child: MyApp(routeName: routeName)));
}

class MyApp extends StatelessWidget {
  String routeName;
   MyApp({super.key,required this.routeName});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize:  Size( 430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child){
        return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: routeName,
        routes: {
          AppRoutes.homeRoute: (context) => HomeScreen(),
          AppRoutes.loginRoute: (context) => LoginScreen(),
           AppRoutes.registerRoute: (context) => RegisterScreen(),
           AppRoutes.productDetailsRoute: (context) => ProductDetails(),
           AppRoutes.cartScreenRoute: (context) => CartScreen(),
         },
        theme: AppTheme.lightTheme
        );
          }
    );
  }


}