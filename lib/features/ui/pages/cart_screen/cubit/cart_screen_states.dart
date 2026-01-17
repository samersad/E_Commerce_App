import 'package:e_commerce_app/domain/entities/response/cart/get_cart/get_cart.dart';

abstract class CartScreenStates {}
class AddCartInitialState extends CartScreenStates{}
class AddCartLoadingState extends CartScreenStates{}
class AddCartErrorState extends CartScreenStates{
  String message;

  AddCartErrorState({required this.message});
}
class AddCartSuccessState extends CartScreenStates {
  int numOfCartItems;

  AddCartSuccessState({required this.numOfCartItems});
}

class GetCartLoadingState extends CartScreenStates{}
class GetCartErrorState extends CartScreenStates{
  String message;

  GetCartErrorState({required this.message});
}
class GetCartSuccessState extends CartScreenStates{
GetCart getCart;
String? message;

GetCartSuccessState({required this.getCart, this.message});

}



class  DeleteItemsCartLoadingState extends CartScreenStates{}
class DeleteItemsCartErrorState extends CartScreenStates{
  String message;

  DeleteItemsCartErrorState({required this.message});
}
class DeleteItemsCartSuccessState extends CartScreenStates{
  GetCart getCart;

  DeleteItemsCartSuccessState({required this.getCart});
}

class UpdateCountsCartLoadingState extends CartScreenStates{}
class UpdateCountsCartErrorState extends CartScreenStates{
  String message;

  UpdateCountsCartErrorState({required this.message});
}
class UpdateCountsCartSuccessState extends CartScreenStates{
  GetCart getCart;

  UpdateCountsCartSuccessState({required this.getCart});
}



