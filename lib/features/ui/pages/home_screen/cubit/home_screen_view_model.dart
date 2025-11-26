import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../tabs/favorite_tab/favorite_tab.dart';
import '../../tabs/home_tab/home_tab.dart';
import '../../tabs/product_tab/product_tab.dart';
import '../../tabs/profile_tab/profile_tab.dart';
import 'home_screen_states.dart';

@injectable
class HomeScreenViewModel extends Cubit<HomeScreenStates>{
  HomeScreenViewModel():super(HomeInitialState());
  //todo hold data and handel logic

  int selectedIndex = 0;

  final List<Widget> tabs = [
    HomeTab(),
    ProductTab(),
    FavoriteTab(),
    ProfileTab(),
  ];
  final List<String> selectedIcons = [
    AppAssets.selectedHomeIcon,
    AppAssets.selectedCategoryIcon,
    AppAssets.selectedFavoriteIcon,
    AppAssets.selectedProfileIcon,
  ];

  final List<String> unSelectedIcons = [
    AppAssets.unSelectedHomeIcon,
    AppAssets.unSelectedCategoryIcon,
    AppAssets.unSelectedFavoriteIcon,
    AppAssets.unSelectedProfileIcon,
  ];

void changeSelectedIndex(int  index){
  selectedIndex = index;
  emit(ChangeSelectedIndexState());

}
}
