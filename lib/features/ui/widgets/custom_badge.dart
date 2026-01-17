  import 'package:e_commerce_app/features/ui/pages/cart_screen/cubit/cart_screen_states.dart';
import 'package:e_commerce_app/features/ui/pages/cart_screen/cubit/cart_screen_view_model.dart';
import 'package:e_commerce_app/features/ui/pages/tabs/product_tab/cubit/product_tab_states.dart';
import 'package:flutter/material.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';

  import '../../../core/utils/app_assets.dart';
  import '../../../core/utils/app_colors.dart';
  import '../../../core/utils/app_routes.dart';
import '../pages/tabs/product_tab/cubit/product_tab_view_model.dart';

  class CustomAppBarBadge extends StatelessWidget {
    final int count;

    const CustomAppBarBadge({required this.count, Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      final currentRoute = ModalRoute.of(context)?.settings.name;
      return InkWell(
        onTap: currentRoute != AppRoutes.cartRoute
            ? () {
                Navigator.of(context).pushNamed(AppRoutes.cartScreenRoute);
              }
            : null,
        child: BlocBuilder<CartScreenViewModel, CartScreenStates>(
         builder: (context, state) {
           final  viewModel = CartScreenViewModel.get(context);
           return Badge(
          alignment: AlignmentDirectional.topStart,
          backgroundColor: AppColors.greenColor,
          label: Text(viewModel.numOfCartItems.toString()),
          child: ImageIcon(
             AssetImage(AppAssets.shoppingCart),
            size: 35.sp,
            color: AppColors.primaryColor,
          ),
        );
    },
  ),
      );
    }
  }
