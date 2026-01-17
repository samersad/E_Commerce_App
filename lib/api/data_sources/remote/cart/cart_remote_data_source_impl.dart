
import 'package:dio/dio.dart';
import 'package:e_commerce_app/api/api_services.dart';
import 'package:e_commerce_app/api/mappers/add_cart_response_mapper.dart';
import 'package:e_commerce_app/api/mappers/get_items_cart_mapper.dart';
import 'package:e_commerce_app/api/model/request/add_product_request_dto.dart';
import 'package:e_commerce_app/core/cache/shared_prefs_helper.dart';
import 'package:e_commerce_app/data/data_sources/remote/cart/cart_remote_data_source.dart';
import 'package:e_commerce_app/domain/entities/request/add_product_request.dart';
import 'package:e_commerce_app/domain/entities/response/cart/add_cart/add_cart_response.dart';
import 'package:e_commerce_app/domain/entities/response/cart/get_cart/get_cart_response.dart';
import 'package:e_commerce_app/domain/repositories/cart/cart_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/exception/app_exceptions.dart';
import '../../../model/request/count_request_dto.dart';
@Injectable(as: CartRemoteDataSource)
 class CartRemoteDataSourceImpl implements CartRemoteDataSource{

  ApiServices apiServices;
  CartRemoteDataSourceImpl({required this.apiServices});
  @override
  Future<AddCartResponse> addToCart(String productId) async {
    try{
      AddProductRequestDto productDto=AddProductRequestDto(productId:productId );
     String? token=SharedPrefsHelper.getData(key: "token") as String;
     var addCartResponse=await apiServices.addToCart(productDto, token);
     //todo addCartResponseDto to AddCartResponse
      return addCartResponse.toAddCartResponse();
    }
    on DioException catch(e){
      String message=(e.error  as AppExceptions).message;
      throw ServerException(message: message);
    }
  }

  @override
  Future<GetCartResponse> getItemsCart() async {
    try{
      String? token=SharedPrefsHelper.getData(key: "token") as String;
      var getItemsCartResponse=await apiServices.getItemsCart(token ??'');
      //todo addCartResponseDto to AddCartResponse
      return getItemsCartResponse.toGetCartResponse();
    }
    on DioException catch(e){
      String message=(e.error  as AppExceptions).message;
      throw ServerException(message: message);
    }
  }

  @override
  Future<GetCartResponse> deleteItemsCart(String productId) async {
    try{
      String? token=SharedPrefsHelper.getData(key: "token") as String;
      var deleteItemsCartResponse=await apiServices.deleteItemsCart(productId,token ??'');
      //todo addCartResponseDto to AddCartResponse
      return deleteItemsCartResponse.toGetCartResponse();
    }
    on DioException catch(e){
      String message=(e.error  as AppExceptions).message;
      throw ServerException(message: message);
    }
  }

  @override
  Future<GetCartResponse> updateCountsCart(String productId, int count) async {
    try{
      String? token=SharedPrefsHelper.getData(key: "token") as String;
      CountRequestDto countRequestDto =CountRequestDto(count: "$count");
      var updateCountsCartResponse=await apiServices.updateItemsCart(productId,token ??'',countRequestDto);
      //todo addCartResponseDto to AddCartResponse
      return updateCountsCartResponse.toGetCartResponse();
    }
    on DioException catch(e){
      String message=(e.error  as AppExceptions).message;
      throw ServerException(message: message);
    }
  }
}