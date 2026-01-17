
import 'package:e_commerce_app/domain/repositories/cart/cart_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/response/cart/get_cart/get_cart_response.dart';

@injectable
class DeleteItemsCartUseCase{
  CartRepository cartRepository;
  DeleteItemsCartUseCase({required this.cartRepository});
  Future<GetCartResponse> invoke(String productId){
    return cartRepository.deleteItemsCart(productId);
  }

}