


import 'package:e_commerce_app/domain/entities/response/cart/get_cart/get_cart.dart';

class GetCartResponse {
  final String? status;
  final int? numOfCartItems;
  final String? cartId;
  final GetCart? data;

  GetCartResponse ({
    this.status,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });
}









