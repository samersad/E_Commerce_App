
import 'package:e_commerce_app/domain/entities/response/cart/add_cart/add_cart.dart';

import '../model/response/cart/add_cart/add_cart_dto.dart';
import 'add_product_mapper.dart';

extension  AddCartMapper on AddCartDto{
  AddCart toAddCart(){
      return AddCart(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        cartOwner: cartOwner,
        products: products?.map((AddProductMapper) {
          return AddProductMapper.toAddProduct();
        },).toList(),
        totalCartPrice: totalCartPrice,
        v: v
      );
    }

  }