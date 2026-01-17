import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/domain/entities/response/cart/get_cart/get_cart.dart';
import 'package:e_commerce_app/domain/entities/response/cart/get_cart/get_products.dart';
import 'package:e_commerce_app/features/ui/pages/cart_screen/cart_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_routes.dart';
import '../pages/cart_screen/cubit/cart_screen_view_model.dart';
import 'custom_txt.dart';

class CartItem extends StatefulWidget {
  GetProducts getProducts;

  CartItem({required this.getProducts});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Container(
          height: 110.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.r),
            border: Border.all(color: AppColors.primary300pacity, width: 1),
          ),
          child: Row(
            children: [
              _buildImageContainer(image: widget.getProducts.product!.imageCover ?? ''),
              Expanded(
                child: Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
                  child: Column(
                    children: [
                      _buildItemHeader(widget.getProducts.product!.title ?? '',
                          context, widget.getProducts.product!.id ?? ''),
                      SizedBox(height: 5.h),
                      _buildItemPrice(price:widget.getProducts.price?.toDouble() ?? 0.0,
                        count: widget.getProducts.count!.toInt(),
                        onPressedDecrement: () {
                          int count = widget.getProducts.count!.toInt();
                          if (count > 1) count--;
                          CartScreenViewModel.get(context).updateCountsCart(
                              widget.getProducts.product?.id ?? "",
                              count);
                        },
                        onPressedIncrement: () {
                          int count = widget.getProducts.count!.toInt();
                          count++;
                          CartScreenViewModel.get(context).updateCountsCart(
                              widget.getProducts.product?.id ?? "",
                              count);

                        },


                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildImageContainer({required String image}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.primary300pacity, width: 1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: CachedNetworkImage(
          width: 130.w,
          height: 110.h,
          fit: BoxFit.cover,
          imageUrl: image,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(
              color: AppColors.yellowColor,
            ),
          ),
          errorWidget: (context, url, error) => const Icon(
            Icons.error,
            color: AppColors.redColor,
          ),
        ),
      ),
    );
  }

  Widget _buildItemHeader(
      String title, BuildContext context, String productId) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: CustomTxt(text: title)),
        InkWell(
          onTap: () {
            // TODO: delete item from cart
            CartScreenViewModel.get(context).deleteItemsCart(productId);
          },
          child: Icon(
            CupertinoIcons.delete,
            color: AppColors.primaryColor,
            size: 25.sp,
          ),
        ),
      ],
    );
  }
  Widget _buildItemPrice({required double price,
    required int count,required VoidCallback onPressedDecrement,
    required VoidCallback onPressedIncrement})  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTxt(
          text: 'Egy ${price*count}',
          fontWeight: FontWeight.bold,
          fontSize: 18.sp,
        ),
        _buildQuantityControl(count,
             onPressedDecrement,
            onPressedIncrement)

      ],
    );
  }
  Widget _buildQuantityControl(
      int count,
      VoidCallback onPressedDecrement,VoidCallback onPressedIncrement,) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: onPressedDecrement,
            icon: Icon(
              Icons.remove_circle_outline_rounded,
              color: AppColors.whiteColor,
              size: 25.sp,
            ),
          ),
          CustomTxt(
            text: '$count',
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            fontColor: AppColors.whiteColor,
          ),
          IconButton(
            onPressed: onPressedIncrement,
            icon: Icon(
              Icons.add_circle_outline_rounded,
              color: AppColors.whiteColor,
              size: 25.sp,
            ),
          ),
        ],
      ),
    );
  }
}