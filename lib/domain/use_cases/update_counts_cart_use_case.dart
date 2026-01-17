
import 'package:e_commerce_app/domain/repositories/cart/cart_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/response/cart/get_cart/get_cart_response.dart';

@injectable
class UpdateCountsCartUseCase{
  CartRepository cartRepository;
  UpdateCountsCartUseCase({required this.cartRepository});
  Future<GetCartResponse> invoke(String productId,int count){
    return cartRepository.updateCountsCart(productId,count);
  }

}