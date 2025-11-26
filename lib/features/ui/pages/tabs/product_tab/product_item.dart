import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/domain/entities/response/product/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text/auto_size_text.dart';
class ProductItem extends StatelessWidget {
   ProductItem({super.key,required this.productItem});
Product productItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.whiteColor,
        border: Border.all(color: AppColors.primaryDark,width: 2),
      ),
      child: Column(
        children: [
          Stack(
            children: [
             ClipRRect(
               borderRadius: BorderRadius.circular(15),
               child: CachedNetworkImage(
                 width: 191.w,
                   height: 120.h,
                   fit: BoxFit.cover,
                   imageUrl: productItem.imageCover??"",
                 placeholder: (context, url) => CircularProgressIndicator(color: AppColors.primaryDark,),
                 errorWidget: (context, url, error) =>Icon(Icons.error) ,
               ),
             ),
              Positioned(
                top: 8.h,
                  right: 8.w,
                  child: CircleAvatar(
                    backgroundColor: AppColors.whiteColor,
                    radius: 20.r,
                    child: Center(child: IconButton(onPressed: (){},
                        icon: Icon(Icons.favorite_border,color: AppColors.primaryColor,)),),
                  ))
            ],
          ),
          SizedBox(height: 16.h,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8.w,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  "${productItem.title??""}",
                  style: AppStyles.bold20primary,
                  maxLines:1,
                ),
                SizedBox(height: 2.h,),
                Row(
                  children: [
                    AutoSizeText(
                      "EGP ${productItem.price??""}",
                      style: AppStyles.bold16Primary,
                      maxLines:1,
                    ),
                    SizedBox(width: 12.w,),
                    AutoSizeText(
                      "${(productItem.price)!*1.5}",
                      style: AppStyles.bold16Primary.copyWith(
                        color: AppColors.primaryColor,
                        decoration: TextDecoration.lineThrough,height: 2
                      ),
                      maxLines:1,
                    ),


                  ],
                ),
                SizedBox(height: 2.h,),
                Row(
                  children: [
                    AutoSizeText(
                      "Review(${productItem.ratingsAverage})",
                      style: AppStyles.bold16Primary,
                      maxLines:1,
                    ),
                    SizedBox(width: 6.w,),
                    Icon(Icons.star,color: AppColors.yellowColor,size: 25.sp,),
                    Spacer(),
                    InkWell(
                      onTap: () {
                      },
                      splashColor: AppColors.transparentColor,
                      child: Icon(Icons.add_circle,size: 40.sp,color: AppColors.primaryColor,),
                    )


                  ],
                ),

              ],
            ),
          )


        ],
      ),
    );
  }
}
