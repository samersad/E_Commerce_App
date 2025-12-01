
import 'package:e_commerce_app/api/mappers/get_cart_mapper.dart';
import 'package:e_commerce_app/api/model/response/cart/get_cart/get_cart_response_dto.dart';
import 'package:e_commerce_app/domain/entities/response/cart/get_cart/get_cart_response.dart';



extension  GetItemsCartMapper on GetCartResponseDto{
  GetCartResponse toGetCartResponse(){
      return GetCartResponse(
        status: status,
        numOfCartItems: numOfCartItems,
        cartId: cartId,
        data: data!.toGetCart()
      );
    }

  }