import 'package:e_commerce_app/features/ui/pages/tabs/product_tab/widget/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/di.dart';
import '../../../../../core/utils/app_colors.dart';
import '../home_tab/widget/loading_widget.dart';
import '../home_tab/widget/main_error_widget.dart';
import 'cubit/product_tab_states.dart';
import 'cubit/product_tab_view_model.dart';
import 'package:e_commerce_app/domain/entities/response/product/product.dart';

class ProductTab extends StatefulWidget {
  ProductTab({super.key});

  @override
  State<ProductTab> createState() => _ProductTabState();
}

class _ProductTabState extends State<ProductTab> {
  final TextEditingController searchCtrl = TextEditingController();
  ProductTabViewModel viewModel = getIt<ProductTabViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<ProductTabViewModel, ProductTabStates>(
        bloc: viewModel,
        builder: (context, state) {
          if (state is ProductTabErrorState) {
            return MainErrorWidget(errorMessage: state.message);
          }
          else if (state is ProductTabSuccessState) {
            return Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 2.5.h,
                      crossAxisSpacing: 16.w,
                      mainAxisSpacing: 16.h,
                    ),
                    itemCount: state.productsList!.length,
                    itemBuilder: (context, index) {
                      return ProductItem(
                        productItem: state.productsList![index],
                        isLoading: false,
                      );
                    },
                  ),
                ),
              ],
            );
          }
          else if (state is ProductTabLoadingState) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 2.5.h,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
              ),
              itemCount: 30,
              itemBuilder: (context, index) {
                return ProductItem(
                  productItem: Product(
                    id: "",
                    title: "",
                    description: "",
                    imageCover: "",
                    price: 0,
                    ratingsAverage: 0,
                  ),
                  isLoading: true,
                );
              },
            );
          }
          return LoadingWidget();
        },
      ),
    );
  }
}
