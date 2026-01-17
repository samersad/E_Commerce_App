
import 'package:e_commerce_app/api/model/response/favorite/add_to_favorite_dto.dart';
import 'package:e_commerce_app/domain/entities/response/cart/add_cart/add_cart.dart';

import '../../domain/entities/response/favorite/add_to_favorite.dart';
import '../model/response/cart/add_cart/add_cart_dto.dart';
import 'add_product_mapper.dart';

extension  AddProductFavorite on AddToFavoriteDto{
  AddToFavorite toAddFavorite(){
    return AddToFavorite(
      message: message,
      data: data!,
      status: status,
    );



  }

  }