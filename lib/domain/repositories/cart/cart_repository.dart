
import 'package:e_commerce_app/domain/entities/response/cart/add_cart/add_cart_response.dart';
import 'package:e_commerce_app/domain/entities/response/cart/get_cart/get_cart_response.dart';

abstract class CartRepository{
  Future<AddCartResponse> addToCart(String productId);
  Future<GetCartResponse> getItemsCart();
  Future<GetCartResponse> deleteItemsCart(String productId);
  Future<GetCartResponse> updateCountsCart(String productId,int count);


}