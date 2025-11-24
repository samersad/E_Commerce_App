import 'package:e_commerce_app/config/di.dart';
import 'package:e_commerce_app/core/utils/app_validator.dart';
import 'package:e_commerce_app/core/utils/dialog_utils.dart';
import 'package:e_commerce_app/features/ui/auth/auth_states.dart';
import 'package:e_commerce_app/features/ui/auth/login/cubit/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/app_styles.dart';
import '../../widgets/custom_elevated_buttom.dart';
import '../../widgets/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  bool hidePassword = true;

  LoginViewModel viewModel = getIt<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel, AuthStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is AuthLoadingState) {
          DialogUtils.showLoading(context: context, msg: "Loading...");
        } else if (state is AuthErrorState) {
          DialogUtils.hideLoading(context: context);
          DialogUtils.showMessage(context: context, msg: state.errorMessage,
            pos: "Ok",
            posAction: () {
              Navigator.of(context).pop();
            },
            title: "Error",
          );
        } else if (state is AuthSuccessState) {
          DialogUtils.hideLoading(context: context);
          DialogUtils.showMessage(
            context: context,
            msg: "Login Success",
            title: "Success",
            pos: "Ok",
            nav: "Dismiss",
            posAction: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(AppRoutes.registerRoute);
            },
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 40.h),

                  /// LOGO
                  Image.asset(AppAssets.route),

                  SizedBox(height: 40.h),

                  Text("Welcome Back To Route", style: AppStyles.bold24white),
                  SizedBox(height: 5.h),
                  Text(
                    "Please sign in with your mail",
                    style: AppStyles.regular16White,
                  ),
                  SizedBox(height: 30.h),
                  Form(
                    key: viewModel.formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("Email", style: AppStyles.regular18white),
                        SizedBox(height: 24.h),
                        CustomTextFormField(
                          controller: viewModel.emailCtrl,
                          hintStyle: AppStyles.medium18black,
                          hintText: "enter your email",
                          fillColor: AppColors.whiteColor,
                          validator: (val) {
                            AppValidators.validateEmail(val);
                          },
                        ),
                        SizedBox(height: 20.h),

                        /// PASSWORD FIELD
                        Text("Password", style: AppStyles.regular18white),
                        SizedBox(height: 24.h),
                        CustomTextFormField(
                          controller: viewModel.passwordCtrl,
                          hintStyle: AppStyles.medium18black,
                          hintText: "enter your password",
                          fillColor: AppColors.whiteColor,
                          obscureText: hidePassword,
                          validator: (val) {
                            AppValidators.validatePassword(val);
                          },
                          suffixIconName: IconButton(
                            icon: Icon(
                              hidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() => hidePassword = !hidePassword);
                            },
                          ),
                        ),

                        SizedBox(height: 10.h),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child:  Text(
                              "Forgot password",
                              style: AppStyles.regular18white
                            ),
                          ),
                        ),
                        SizedBox(height: 24.h),
                        CustomElevatedButtom(
                          onPressed: () {
                            viewModel.login();
                          },
                          text: "Login",
                          backgroundColorElevated: Colors.white,
                          textStyle: AppStyles.bold20primary,
                          borderColor: Colors.transparent,
                          customPadding: 16.h,
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(
                                  context,
                                ).pushReplacementNamed(AppRoutes.registerRoute);
                              },
                              child: const Text(
                                "Create Account",
                                style: TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
