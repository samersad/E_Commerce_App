
import 'package:e_commerce_app/api/mappers/products_mapper.dart';
import 'package:e_commerce_app/api/model/response/cart/get_cart/get_products_dto.dart';
import 'package:e_commerce_app/domain/entities/response/cart/add_cart/add_cart.dart';
import 'package:e_commerce_app/domain/entities/response/cart/get_cart/get_products.dart';

import '../model/response/cart/add_cart/add_cart_dto.dart';
import 'add_product_mapper.dart';

extension  GetProductMapper on GetProductsDto{
  GetProducts toGetProducts(){
      return GetProducts(
        id: id,
        product: product!.toProduct(),
        count: count,
        price: price
      );
    }

  }