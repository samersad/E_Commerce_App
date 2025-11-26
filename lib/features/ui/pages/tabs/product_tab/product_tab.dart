import 'package:e_commerce_app/features/ui/pages/tabs/product_tab/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/di.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../home_tab/widget/loading_widget.dart';
import '../home_tab/widget/main_error_widget.dart';
import 'cubit/product_tab_states.dart';
import 'cubit/product_tab_view_model.dart';

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
    // TODO: implement initState
    super.initState();
    viewModel.getProducts();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: BlocBuilder<ProductTabViewModel,ProductTabStates>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is ProductTabErrorState) {
          return  MainErrorWidget(errorMessage: state.message,
          );
        }
        else if (state is ProductTabSuccessState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                  childAspectRatio: 2/2.5.h,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.h),
                  itemCount: state.productsList!.length,
                  itemBuilder: (context, index) {
                    return ProductItem(productItem: state.productsList![index],);
                  },

              ),
            ),

            ],
          );
        }

        else{
          return LoadingWidget();
        }
      },
    )
    );

  }
}


