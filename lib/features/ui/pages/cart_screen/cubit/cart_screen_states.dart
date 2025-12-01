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
GetCartSuccessState({required this.getCart});
}

