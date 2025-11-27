import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/domain/entities/response/common/category_or_brands.dart';
import 'package:e_commerce_app/features/ui/pages/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:e_commerce_app/features/ui/pages/tabs/home_tab/widget/category_or_brand_item.dart';
import 'package:e_commerce_app/features/ui/pages/tabs/home_tab/widget/loading_widget.dart';
import 'package:e_commerce_app/features/ui/pages/tabs/home_tab/widget/main_error_widget.dart';
import 'package:e_commerce_app/features/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../config/di.dart';
import 'cubit/home_tab_view_model.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  TextEditingController searchCtrl = TextEditingController();
  HomeTabViewModel viewModel = getIt<HomeTabViewModel>();
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
   viewModel.getCategories();
   viewModel.getBrands();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16.h,
          children: [
            SizedBox(height: 40.h),
            Image.asset(AppAssets.routeHome),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    controller: searchCtrl,
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
                SizedBox(width: 24.w),
                Icon(Icons.shopping_cart, color: AppColors.primaryColor),
              ],
            ),
            bannersShow(),
            lineBreak(name: "Categories"),
            BlocBuilder<HomeTabViewModel,HomeTabStates>(
              bloc: viewModel,
                buildWhen: (previous, state) {
                  if (state is CategoriesSuccessState) {
                    return true;
                  }
                  else{
                    return false;
                  }
                },
                builder: (context, state) {
                  if (state is CategoriesOrBrandsErrorState) {
                  return  MainErrorWidget(errorMessage: state.message,onPressed: () {
                    viewModel.getCategories();
                  },);
                  }
                  else if (state is CategoriesSuccessState) {
                    return buildCategoryBrandSection(list: state.categoriesList,isLoading: false);
                  }
                  if (state is CategoriesOrBrandsLoadingState) {
                    return buildCategoryBrandSection(isLoading: true,
                      list: List.generate(50, (index) => CategoryOrBrands(
                        id: "",
                        name: "",
                        slug: "",
                        createdAt: "",
                        updatedAt: "",
                      )),

                    );
                  }
                  else{
                    return LoadingWidget();
                  }

                },
            ),
            lineBreak(name: "Brands"),
            BlocBuilder<HomeTabViewModel,HomeTabStates>(
              bloc: viewModel,
              buildWhen: (previous, state) {
                if (state is BrandsSuccessState) {
                  return true;
                }
                else{
                  return false;
                }
              },
                builder: (context, state) {
                  if (state is CategoriesOrBrandsErrorState) {
                    return  MainErrorWidget(errorMessage: state.message,onPressed: () {
                      viewModel.getBrands();
                    },);
                  }
                  else if (state is BrandsSuccessState) {
                    return buildCategoryBrandSection(list: state.brandsList,isLoading: false);
                  }
                  if (state is CategoriesOrBrandsLoadingState) {
                    return buildCategoryBrandSection(isLoading: true,
                      list: List.generate(50, (index) => CategoryOrBrands(
                        id: "",
                        name: "",
                        slug: "",
                        createdAt: "",
                        updatedAt: "",
                      )),

                    );
                  }
                  else{
                    return LoadingWidget();
                  }
                },)


          ],
        ),
      ),
    );
  }

  Widget bannersShow() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.h,
        viewportFraction: 1,
        enlargeCenterPage: false,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayCurve: Curves.easeInBack,
        onPageChanged: (index, reason) {
          viewModel.changeSelectedIndex(index);
        },
      ),
      items: viewModel.pannersList.map((item) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(item, fit: BoxFit.fill, width: double.infinity),

            Positioned(
              bottom: 20.h,
              child: BlocBuilder<HomeTabViewModel, HomeTabStates>(
                bloc: viewModel,
                buildWhen: (previous, state) =>
                state is ChangeSelectedIndexState,
                builder: (context, state) {
                  return Row(
                    children: List.generate(
                      viewModel.pannersList.length,
                          (index) => AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: viewModel.currentIndex == index
                              ? AppColors.primaryColor
                              : Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }).toList(),
    );
  }

  Widget lineBreak({required String name}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name, style: AppStyles.bold18primaryDark),
        TextButton(
          onPressed: () {},
          child: Text("view all", style: AppStyles.bold12primaryDark),
        ),
      ],
    );
  }

  Skeletonizer buildCategoryBrandSection({required List<CategoryOrBrands>? list ,required bool  isLoading}) {
    return Skeletonizer(
      enabled: isLoading,
      enableSwitchAnimation: true,
      ignoreContainers: false,
      child: SizedBox(
        height: 300.h,
        width: double.infinity,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16.h,
            crossAxisSpacing: 16.w,
          ),
          scrollDirection: Axis.horizontal,
          physics: const ScrollPhysics(),
          itemCount: list!.length,
          itemBuilder: (context, index) {
            return CategoryOrBrandItem(item: list![index],);
          },
        ),
      ),
    );
  }
}
