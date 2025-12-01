import 'package:e_commerce_app/features/ui/pages/tabs/home_tab/widget/loading_widget.dart';
import 'package:e_commerce_app/features/ui/pages/tabs/home_tab/widget/main_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../widgets/cart_item.dart';
import '../../widgets/custom_badge.dart';
import '../../widgets/custom_txt.dart';
import 'cubit/cart_screen_states.dart';
import 'cubit/cart_screen_view_model.dart';


class CartScreen extends StatefulWidget {
  static const String routeName = "CartItems";


  CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}
class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CartScreenViewModel.get(context).getItemsCart();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _customAppBar(context),
        body: BlocBuilder<CartScreenViewModel, CartScreenStates>(
            builder: (context, state) {
           if (state is GetCartErrorState) {
                return MainErrorWidget(errorMessage: state.message);
              } else if (state is GetCartSuccessState) {
                return Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                          itemCount: state.getCart.products!.length??0,
                          itemBuilder: (context, index) {
                            return CartItem(getProducts: state.getCart.products![index]);
                          },
                        )),
                    _buildCheckOut(context: context,price: state.getCart.totalCartPrice!.toDouble() ),
                  ],
                );
              } else {
                return LoadingWidget();
              }
            }));
  }
  Widget _buildCheckOut({required BuildContext context,required double price}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 50.h, left: 16.w, right: 16.w),
      child: Row(
        children: [
          Column(
            children: [
              const CustomTxt(text: "Total Price"),
              CustomTxt(text: "$price", fontWeight: FontWeight.bold),
            ],
          ),
          SizedBox(
            width: 30.w,
          ),
          Expanded(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor),
                  onPressed: () {
                    //todo: navigate to payment section
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const CustomTxt(
                          text: "Check Out", fontColor: AppColors.whiteColor),
                      Icon(
                        Icons.arrow_forward,
                        color: AppColors.whiteColor,
                        size: 28.sp,
                      ),
                    ],
                  )))
        ],
      ),
    );
  }
}
PreferredSizeWidget _customAppBar(BuildContext context) {
  return AppBar(
    surfaceTintColor: Colors.transparent,
    toolbarHeight: 50.h,
    centerTitle: true,
    elevation: 0,
    title: const Text("Cart"),
    backgroundColor: Colors.transparent,
    foregroundColor: AppColors.primaryColor,
    titleTextStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
        fontSize: 24.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.primaryColor),
    actions: [
      IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {},
        icon: Icon(
          Icons.search_outlined,
          size: 35.sp,
          color: AppColors.primaryColor,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(right: 16.w),
        child: const CustomAppBarBadge(count: 5),
      ),
    ],
  );
}
