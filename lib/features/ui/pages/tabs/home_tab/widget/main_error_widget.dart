import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class MainErrorWidget extends StatelessWidget {
  const MainErrorWidget({super.key, required this.errorMessage, this.onPressed});

  final String errorMessage;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(errorMessage, style: AppStyles.bold14primary),
        onPressed!=null?
        ElevatedButton(onPressed: onPressed, child: Text("try again", style: AppStyles.bold14primary))
        :
        SizedBox()
      ],
    );
  }
}
