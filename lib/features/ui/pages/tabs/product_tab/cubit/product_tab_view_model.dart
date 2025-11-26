import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/exception/app_exceptions.dart';
import 'package:e_commerce_app/domain/use_cases/get_all_brands_use_case.dart';
import 'package:e_commerce_app/features/ui/pages/tabs/product_tab/cubit/product_tab_states.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../domain/use_cases/get_all_gategories_use_case.dart';
import '../../../../../../domain/use_cases/get_all_products_use_case.dart';

@injectable
class ProductTabViewModel extends Cubit<ProductTabStates> {
  GetAllProductsUseCase getAllProductsUseCase;

  ProductTabViewModel({required this.getAllProductsUseCase})
    : super(ProductTabLoadingState());
  int currentIndex = 0;

  Future<void> getProducts() async {
    try {
      emit(ProductTabLoadingState());
      var productList = await getAllProductsUseCase.invoke();
      //  print(productList);
      emit(ProductTabSuccessState(productsList: productList));
    } on AppExceptions catch (e) {
      emit(ProductTabErrorState(message: e.message));
    }
  }
}
