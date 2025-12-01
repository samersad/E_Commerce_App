
import 'package:e_commerce_app/data/data_sources/remote/cart/cart_remote_data_source.dart';
import 'package:e_commerce_app/domain/entities/response/cart/add_cart/add_cart_response.dart';
import 'package:e_commerce_app/domain/entities/response/cart/get_cart/get_cart_response.dart';
import 'package:e_commerce_app/domain/repositories/cart/cart_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: CartRepository)
 class CartRepositoryImpl implements CartRepository{
  CartRemoteDataSource remoteDataSource;
  CartRepositoryImpl({required this.remoteDataSource});
  @override
  Future<AddCartResponse> addToCart(String productId) {
    return remoteDataSource.addToCart(productId);
  }

  @override
  Future<GetCartResponse> getItemsCart() {
   return remoteDataSource.getItemsCart();
  }
}