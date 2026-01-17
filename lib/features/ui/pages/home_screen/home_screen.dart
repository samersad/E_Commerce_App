import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/features/ui/pages/cart_screen/cubit/cart_screen_view_model.dart';
import 'package:e_commerce_app/features/ui/pages/home_screen/cubit/home_screen_states.dart';
import 'package:e_commerce_app/features/ui/pages/home_screen/cubit/home_screen_view_model.dart';
import 'package:e_commerce_app/features/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/di.dart';
import '../../../../core/utils/app_styles.dart';
import '../../widgets/custom_badge.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenViewModel viewModel =getIt<HomeScreenViewModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CartScreenViewModel.get(context).getItemsCart();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel,HomeScreenStates>(
      bloc: viewModel,
     builder: (context, state) {
       return Scaffold(
         appBar: _buildAppBar(viewModel.selectedIndex),
         backgroundColor: AppColors.whiteColor,
         body: viewModel.tabs[viewModel.selectedIndex],
         bottomNavigationBar: Container(
             decoration: BoxDecoration(
                 color: AppColors.primaryColor,
                 borderRadius: BorderRadius.only(
                   topRight: Radius.circular(16),
                   topLeft: Radius.circular(16),
                 )
             ),
             child:
             AnimatedBottomNavigationBar.builder(
               itemCount: viewModel.tabs.length,
               tabBuilder: (int index, bool isActive) {
                 return Padding(
                   padding: EdgeInsets.only(top: 8.h),
                   child: isActive
                       ?
                   CircleAvatar(
                     backgroundColor: AppColors.whiteColor,
                     child: Image.asset(viewModel.selectedIcons[index],),
                   )
                       : Image.asset(
                     viewModel.unSelectedIcons[index],

                   ),
                 );
               },
               height: 50.h,
               activeIndex: viewModel.selectedIndex,
               gapLocation: GapLocation.none,
               notchSmoothness: NotchSmoothness.verySmoothEdge,
               backgroundColor: Colors.transparent,
               onTap: (index) {
                 viewModel.changeSelectedIndex(index);
               },
             )
         ),
       );
     },
    );
  }
  PreferredSizeWidget _buildAppBar(int index) {
    return AppBar(
      surfaceTintColor: AppColors.transparentColor,
      elevation: 0,
      toolbarHeight: index != 3 ? 120.h : kToolbarHeight,
      leadingWidth: double.infinity,
      leading: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: Image.asset(
                AppAssets.routeHome,
                width: 66.w,
                height: 22.h,
              ),
            ),
            Visibility(
              visible: index != 3,
              child: Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        fillColor: AppColors.whiteColor,
                        borderSideColor: AppColors.primaryColor,
                        hintText: "What do you search for?",
                        hintStyle: AppStyles.bold14primary,
                        prefixIconName: Icon(
                          Icons.search,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    CustomAppBarBadge(count: 0)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}
