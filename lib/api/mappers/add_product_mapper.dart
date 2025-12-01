
import 'package:e_commerce_app/domain/entities/response/cart/add_cart/add_product.dart';

import '../model/response/cart/add_cart/add_product_dto.dart';

extension  AddProductMapper on AddProductDto{
  AddProduct toAddProduct(){
      return AddProduct(
        id: id,
        price: price,
        count: count,
        product: product
      );
    }

  }