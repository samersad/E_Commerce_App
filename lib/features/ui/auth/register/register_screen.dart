import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/app_validator.dart';
import '../../widgets/custom_elevated_buttom.dart';
import '../../widgets/custom_text_form_field.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController fullNameCtrl = TextEditingController(text: "");

  TextEditingController emailCtrl = TextEditingController(text: "");

  TextEditingController passwordCtrl = TextEditingController(text: "");
  TextEditingController phoneNumberCtrl = TextEditingController(text: "");

  GlobalKey<FormState> formkey = GlobalKey<FormState>();


  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Image.asset(
                  AppAssets.route,
                ),
                SizedBox(height: 40.h),
                Form(key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                            "Full Name",
                            style: AppStyles.medium16white
                        ),
                        SizedBox(height: 24.h),
                        CustomTextFormField(controller:fullNameCtrl ,
                          hintStyle:AppStyles.medium16black ,
                          hintText: "enter your full name",
                          fillColor: AppColors.whiteColor,
                          validator: (val) {
                            AppValidators.validateFullName(val);
                          },
                        ),
                        SizedBox(height: 24.h),
                        Text(
                            "Mobile Number",
                            style: AppStyles.medium16white
                        ),
                        SizedBox(height: 24.h),

                        CustomTextFormField(controller:phoneNumberCtrl ,
                          hintStyle:AppStyles.medium16black ,
                          hintText: "enter your mobile no.",
                          fillColor: AppColors.whiteColor,
                          validator: (val) {
                            AppValidators.validatePhoneNumber(val);
                          },
                        ),
                        SizedBox(height: 20.h),
                        Text(
                            "E-mail address",
                            style: AppStyles.medium16white
                        ),
                        SizedBox(height: 24.h),
                        CustomTextFormField(controller:emailCtrl ,
                          hintStyle:AppStyles.medium16black ,
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
                            style: AppStyles.medium16white
                        ),
                        SizedBox(height: 24.h),
                        CustomTextFormField(
                          controller:passwordCtrl ,
                          hintStyle:AppStyles.medium16black ,
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

                        SizedBox(height: 56.h),
                        CustomElevatedButtom(
                          onPressed: () {
                            if (formkey.currentState?.validate()==true) {

                            }
                          },
                          text: "Sign up",
                          backgroundColorElevated: Colors.white,
                          textStyle: AppStyles.bold20primary,
                          borderColor: Colors.transparent,
                          customPadding: 16.h,
                        )
                      ],
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
