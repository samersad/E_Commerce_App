import 'package:e_commerce_app/core/cache/shared_prefs_helper.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      SharedPrefsHelper.removeData(key: "token");
      Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.loginRoute,
          (route) => false,);
    },
        child: Icon(Icons.logout,color: AppColors.redColor,));
  }
}
