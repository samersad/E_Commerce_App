import 'package:e_commerce_app/api/mappers/add_cart_mapper.dart';

import 'package:e_commerce_app/domain/entities/response/cart/add_cart/add_cart_response.dart';

import '../model/response/cart/add_cart/add_cart_response_dto.dart';

extension  AddCartResponseMapper on AddCartResponseDto{
  AddCartResponse toAddCartResponse(){
      return AddCartResponse(
        message: message,
        data: data!.toAddCart(),
        cartId: cartId,
        numOfCartItems: numOfCartItems,
        status: status
      );
    }

  }