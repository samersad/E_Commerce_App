import 'package:e_commerce_app/domain/entities/response/cart/add_cart/add_cart_response.dart';
import 'package:e_commerce_app/domain/entities/response/common/category_or_brands.dart';
import 'package:e_commerce_app/domain/repositories/brands/brands_repository.dart';
import 'package:e_commerce_app/domain/repositories/cart/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToCartUseCase{
  CartRepository cartRepository;
  AddToCartUseCase({required this.cartRepository});
  Future<AddCartResponse> invoke(String productId){
    return cartRepository.addToCart(productId);
  }

}