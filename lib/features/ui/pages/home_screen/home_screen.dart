import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/features/ui/pages/home_screen/cubit/home_screen_states.dart';
import 'package:e_commerce_app/features/ui/pages/home_screen/cubit/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/di.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenViewModel viewModel =getIt<HomeScreenViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel,HomeScreenStates>(
      bloc: viewModel,
     builder: (context, state) {
       return Scaffold(
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
}
