import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/domain/entities/response/product/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widgets/custom_badge.dart';
import '../../../cart_screen/cubit/cart_screen_view_model.dart';
import '../widget/product_slider.dart';
import 'package:readmore/readmore.dart';
class ProductDetails extends StatefulWidget {
   ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
   int productCounter = 0;

   @override
  Widget build(BuildContext context) {
   var productDetailsItem= ModalRoute.of(context)?.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
          title: Text("Product Details"
            , style: AppStyles.bold20primary,),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: AppColors.primaryColor,
                size: 30,
              )),
          CustomAppBarBadge(count: 0,),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                spacing: 16.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductSlider(
                    initialIndex: 0,
                    items: productDetailsItem.images!,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: AutoSizeText(
                          "${productDetailsItem.title??""}",
                          style: AppStyles.bold20primaryDark,
                          maxLines:5,
                        ),
                      ),
                      SizedBox(width: 20.w,),
                      Text("EGP ${productDetailsItem.price}"
                        , style: AppStyles.bold20primaryDark,),
                    ],
                  ),
                  Row(
                    spacing: 10.w,
                    children: [
                      Container(
                        width: 110.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color:AppColors.primary300pacity ,width: 2)
                        ),
                        child: Center(child:AutoSizeText(
                  "${productDetailsItem.sold} Sold",
                        style: AppStyles.bold18primaryDark,
                        maxLines:5,
                       ), ),
                      ),
                      SizedBox(width: 8.w,),
                      Row(
                        spacing: 10.w,
                        children: [
                          Image.asset(AppAssets.star),
                          AutoSizeText(
                            "${productDetailsItem.ratingsAverage}",
                            style: AppStyles.bold18primaryDark,
                            maxLines:5,
                          ),
                          AutoSizeText(
                            "(${productDetailsItem.ratingsQuantity})",
                            style: AppStyles.bold18primaryDark,
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                        padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 7.h),
                        child: Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  productCounter--;
                                  setState(() {});
                                },
                                child: Icon(
                                  Icons.remove_circle_outline,
                                  size: 20.w,
                                  color: AppColors.whiteColor,
                                )),
                            SizedBox(
                              width: 18.w,
                            ),
                            AutoSizeText(
                              '$productCounter',
                              style: AppStyles.bold14white,
                            ),
                            SizedBox(
                              width: 18.w,
                            ),
                            InkWell(
                                onTap: () {
                                  productCounter++;
                                  setState(() {});
                                },
                                child: Icon(
                                  Icons.add_circle_outline,
                                  color: AppColors.whiteColor,
                                  size: 20.w,
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                  Text("Description",style: AppStyles.bold20primaryDark,),
              ReadMoreText(
                "${productDetailsItem.description}",
                trimMode: TrimMode.Line,
                trimLines: 4,
                colorClickableText: AppColors.redColor,
                trimCollapsedText: 'Read more',
                trimExpandedText: '  Read less',
                moreStyle: AppStyles.bold14primary,
              ),
                  SizedBox(
                    height: 48.h,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            'Total price',
                            style: AppStyles.bold20primary.copyWith(
                                color: AppColors.primaryColor.withOpacity(0.6)),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text('${productCounter*(productDetailsItem.price ??0)}', style: AppStyles.bold18primaryDark)
                        ],
                      ),
                      SizedBox(
                        width: 33.w,
                      ),
                      Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17.r)),
                              backgroundColor: AppColors.primaryColor,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 14.w, vertical: 14.h),
                            ),
                            onPressed: () {
                              CartScreenViewModel.get(context).addToCart(productDetailsItem.id ??"");
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_shopping_cart,
                                  color: AppColors.whiteColor,
                                ),
                                SizedBox(
                                  width: 15.w,
                                ),
                                AutoSizeText("Add To Cart",
                                    style: AppStyles.medium20white),
                                SizedBox(
                                  width: 27.w,
                                ),
                              ],
                            )),
                      )
                    ],
                  ),

                ],
              ),
            )),
      ),
    );
  }
}
