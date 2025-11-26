import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/domain/entities/response/category/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryOrBrandItem extends StatelessWidget {
   CategoryOrBrandItem({super.key,required this.category});
  Category category;

  @override
  Widget build(BuildContext context) {
    return
      Column(
      children: [
        Expanded(
          flex: 8,
            child: CachedNetworkImage(
              width: double.infinity,
              height: 10.h,
              fit: BoxFit.cover,
              imageUrl: category.image??"",
              imageBuilder: (context, imageProvider) {
                return CircleAvatar(
                  backgroundImage:imageProvider ,
                  radius: 50.r,
                );
              },
              placeholder: (context, url) => CircularProgressIndicator(color: AppColors.primaryColor,),

              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
        ),
        SizedBox(height: 10.h,),
        Expanded(flex: 4,
            child: Text(category.name??"",
              textWidthBasis: TextWidthBasis.longestLine,
            softWrap: true,
            textAlign: TextAlign.center,
            style: AppStyles.bold14primary,)
        )

      ],
    );
  }
}
