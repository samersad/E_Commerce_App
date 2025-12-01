import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/domain/entities/response/cart/get_cart/get_products.dart';
import 'package:e_commerce_app/domain/use_cases/add_to_cart_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/get_items_cart_use_case.dart';
import 'package:e_commerce_app/features/ui/pages/cart_screen/cubit/cart_screen_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/exception/app_exceptions.dart';

@injectable
class CartScreenViewModel extends Cubit<CartScreenStates>{
  AddToCartUseCase addToCartUseCase;
  GetItemsCartUseCase getItemsCartUseCase;
  CartScreenViewModel({required this.addToCartUseCase,required this.getItemsCartUseCase}):super(AddCartInitialState());
  //todo hold data and handel logic
  int numOfCartItems=0;
  late List<GetProducts> productLst;
  static CartScreenViewModel get(context)=>BlocProvider.of<CartScreenViewModel>(context);
  Future<void> addToCart(String productId)async {
    try {
      emit(AddCartLoadingState());
      var addCartResponse = await addToCartUseCase.invoke(productId);
      numOfCartItems = addCartResponse.numOfCartItems ?? 0;
      print("num od cart $numOfCartItems");
      emit(AddCartSuccessState(numOfCartItems: numOfCartItems));
    }
    on AppExceptions catch (e) {
      emit(AddCartErrorState(message: e.message));
    }
  }
  Future<void> getItemsCart()async {
    try {
      emit(GetCartLoadingState());
      var getCartResponse = await getItemsCartUseCase.invoke();
      numOfCartItems = getCartResponse.numOfCartItems ?? 0;
      productLst=getCartResponse.data!.products ??[];
      emit(GetCartSuccessState(getCart:getCartResponse.data!));
    }
    on AppExceptions catch (e) {
      emit(GetCartErrorState(message: e.message));
    }
  }
}
