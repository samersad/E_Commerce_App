import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/domain/entities/response/cart/get_cart/get_products.dart';
import 'package:e_commerce_app/domain/use_cases/add_to_cart_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/delete_items_cart_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/get_items_cart_use_case.dart';
import 'package:e_commerce_app/features/ui/pages/cart_screen/cubit/cart_screen_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/exception/app_exceptions.dart';
import '../../../../../domain/use_cases/update_counts_cart_use_case.dart';

@injectable
class CartScreenViewModel extends Cubit<CartScreenStates> {
  AddToCartUseCase addToCartUseCase;
  GetItemsCartUseCase getItemsCartUseCase;
  DeleteItemsCartUseCase deleteItemsCartUseCase;
  UpdateCountsCartUseCase updateCountsCartUseCase;

  CartScreenViewModel({
    required this.addToCartUseCase,
    required this.getItemsCartUseCase,
    required this.deleteItemsCartUseCase,
    required this.updateCountsCartUseCase,
  }) : super(AddCartInitialState());

  //todo hold data and handel logic
  int numOfCartItems = 0;
  late List<GetProducts> productLst;

  static CartScreenViewModel get(context) =>
      BlocProvider.of<CartScreenViewModel>(context);

  Future<void> addToCart(String productId) async {
    try {
      emit(AddCartLoadingState());
      var addCartResponse = await addToCartUseCase.invoke(productId);
      numOfCartItems = addCartResponse.numOfCartItems ?? 0;
      print("num of cart $numOfCartItems");
      emit(AddCartSuccessState(numOfCartItems: numOfCartItems));
    } on AppExceptions catch (e) {
      emit(AddCartErrorState(message: e.message));
    }
  }

  Future<void> getItemsCart() async {
    try {
      emit(GetCartLoadingState());
      var getCartResponse = await getItemsCartUseCase.invoke();
      numOfCartItems = getCartResponse.numOfCartItems ?? 0;
      productLst = getCartResponse.data!.products ?? [];
      emit(
        GetCartSuccessState(getCart: getCartResponse.data!,
            message: "success"),
      );
    } on AppExceptions catch (e) {
      emit(GetCartErrorState(message: e.message));
    }
  }

  Future<void> deleteItemsCart(String productId) async {
    try {
      emit(DeleteItemsCartLoadingState());
      var deleteItemsCartResponse = await deleteItemsCartUseCase.invoke(
        productId,
      );
      numOfCartItems = deleteItemsCartResponse.numOfCartItems ?? 0;
      // productLst=deleteItemsCartResponse.data!.products ??[];
      emit(
        GetCartSuccessState(
          getCart: deleteItemsCartResponse.data!,
          message: "deleted item successfully",
        ),
      );
      print("delete num of cart $numOfCartItems");
    } on AppExceptions catch (e) {
      emit(DeleteItemsCartErrorState(message: e.message));
    }
  }

  Future<void> updateCountsCart(String productId, int count) async {
    try {
      var updateCountsCartResponse = await updateCountsCartUseCase.invoke(
        productId,
        count,
      );
      // numOfCartItems = updateCountsCartResponse.numOfCartItems ?? 0;
      // productLst=deleteItemsCartResponse.data!.products ??[];
      emit(
        GetCartSuccessState(
          getCart: updateCountsCartResponse.data!,
          message: "updated item successfully",
        ),
      );
      print("update num of cart $numOfCartItems");
    } on AppExceptions catch (e) {
      emit(UpdateCountsCartErrorState(message: e.message));
    }
  }
}
