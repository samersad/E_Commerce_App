
import 'package:e_commerce_app/api/mappers/get_product_mapper.dart';
import 'package:e_commerce_app/api/model/response/cart/get_cart/get_cart_dto.dart';
import 'package:e_commerce_app/domain/entities/response/cart/add_cart/add_cart.dart';
import 'package:e_commerce_app/domain/entities/response/cart/get_cart/get_cart.dart';

import '../model/response/cart/add_cart/add_cart_dto.dart';
import 'add_product_mapper.dart';

extension  GetCartMapper on GetCartDto{
  GetCart toGetCart(){
      return GetCart(
        id: id,
        cartOwner: createdAt,
        products: products?.map((getProductsDto) {
          return getProductsDto.toGetProducts();
        },).toList(),
        totalCartPrice: totalCartPrice,
        v: v
      );
    }

  }