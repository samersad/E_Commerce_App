import 'package:e_commerce_app/features/ui/auth/auth_states.dart';
import 'package:e_commerce_app/features/ui/auth/register/cubit/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/di.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/app_validator.dart';
import '../../../../core/utils/dialog_utils.dart';
import '../../widgets/custom_elevated_buttom.dart';
import '../../widgets/custom_text_form_field.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

RegisterViewModel viewModel =getIt<RegisterViewModel>();

  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewModel,AuthStates>(
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
            msg: "Register Success",
            title: "Success",
            pos: "Ok",
            nav: "Dismiss",
            posAction: () {
              Navigator.of(context).pop();
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
                  SizedBox(height: 30.h),
                  Image.asset(
                    AppAssets.route,
                  ),
                  SizedBox(height: 20.h),
                  Form(key: viewModel.formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                              "Full Name",
                              style: AppStyles.regular18white
                          ),
                          SizedBox(height: 24.h),
                          CustomTextFormField(controller:viewModel.fullNameCtrl ,
                            hintStyle:AppStyles.medium18black ,
                            hintText: "enter your full name",
                            fillColor: AppColors.whiteColor,
                            validator: (val) {
                              AppValidators.validateFullName(val);
                            },
                          ),
                          SizedBox(height: 24.h),
                          Text(
                              "Mobile Number",
                              style: AppStyles.regular18white
                          ),
                          SizedBox(height: 24.h),

                          CustomTextFormField(controller:viewModel.phoneNumberCtrl ,
                            hintStyle:AppStyles.medium18black ,
                            hintText: "enter your mobile no.",
                            fillColor: AppColors.whiteColor,
                            validator: (val) {
                              AppValidators.validatePhoneNumber(val);
                            },
                          ),
                          SizedBox(height: 20.h),
                          Text(
                              "E-mail address",
                              style: AppStyles.regular18white
                          ),
                          SizedBox(height: 24.h),
                          CustomTextFormField(controller:viewModel.emailCtrl ,
                            hintStyle:AppStyles.medium18black ,
                            hintText: "enter your email address",
                            fillColor: AppColors.whiteColor,
                            validator: (val) {
                              AppValidators.validateEmail(val);
                            },
                          ),
                          SizedBox(height: 24.h),
                          /// PASSWORD FIELD
                          Text(
                              "Password",
                              style: AppStyles.regular18white
                          ),
                          SizedBox(height: 24.h),
                          CustomTextFormField(
                            controller:viewModel.passwordCtrl ,
                            hintStyle:AppStyles.medium18black ,
                            hintText: "enter your password",
                            fillColor: AppColors.whiteColor,
                            obscureText: hidePassword,
                            validator: (val) {
                              AppValidators.validatePassword(val);
                            },
                            suffixIconName: IconButton(
                              icon: Icon(hidePassword ? Icons.visibility_off :
                              Icons.visibility),
                              onPressed: () {
                                setState(() => hidePassword = !hidePassword);
                              },
                            ),

                          ),
                          SizedBox(height: 24.h),
                          Text(
                              "Re Password",
                              style: AppStyles.regular18white
                          ),
                          SizedBox(height: 24.h),
                          CustomTextFormField(
                            controller:viewModel.rePasswordCtrl ,
                            hintStyle:AppStyles.medium18black ,
                            hintText: "enter your Confirmation password",
                            fillColor: AppColors.whiteColor,
                            obscureText: hidePassword,
                            validator: (val) {
                              AppValidators.validateConfirmPassword(val,viewModel.passwordCtrl.text);
                            },
                            suffixIconName: IconButton(
                              icon: Icon(hidePassword ? Icons.visibility_off :
                              Icons.visibility),
                              onPressed: () {
                                setState(() => hidePassword = !hidePassword);
                              },
                            ),

                          ),
                          SizedBox(height: 56.h),
                          CustomElevatedButtom(
                            onPressed: () {
                              viewModel.register();
                            },
                            text: "Sign up",
                            backgroundColorElevated: Colors.white,
                            textStyle: AppStyles.bold20primary,
                            borderColor: Colors.transparent,
                            customPadding: 16.h,
                          ),
                          SizedBox(height: 10.h),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Have an account?",
                                style: AppStyles.regular18white
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(
                                    context,
                                  ).pushReplacementNamed(AppRoutes.loginRoute);
                                },
                                child:  Text(
                                  "Login ",
                                  style: AppStyles.bold16White
                                ),
                              ),
                            ],
                          ),

                        ],
                      )
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
