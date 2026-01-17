import 'package:dio/dio.dart';
import 'package:e_commerce_app/api/end_points.dart';
import 'package:e_commerce_app/api/model/response/auth_response_dto.dart';
import 'package:e_commerce_app/api/model/response/brands/brands_response_dto.dart';
import 'package:e_commerce_app/api/model/response/cart/get_cart/get_cart_response_dto.dart';
import 'package:e_commerce_app/api/model/response/category/category_response_dto.dart';
import 'package:e_commerce_app/domain/entities/response/cart/get_cart/get_cart_response.dart';
import 'package:retrofit/retrofit.dart';

import 'model/request/add_product_request_dto.dart';
import 'model/request/count_request_dto.dart';
import 'model/request/login_request_dto.dart';
import 'model/request/register_request_dto.dart';
import 'model/response/cart/add_cart/add_cart_response_dto.dart';
import 'model/response/products/product_response_dto.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;
  @POST(EndPoints.loginApi)
  Future<AuthResponseDto> login(@Body() LoginRequestDto loginRequest);

  @POST(EndPoints.registerApi)
  Future<AuthResponseDto> register(@Body() RegisterRequestDto registerRequest);

  @GET(EndPoints.getCategoriesApi)
  Future<CategoryResponseDto> getAllCategories();
  @GET(EndPoints.getBrandsApi)
  Future<BrandsResponseDto> getAllBrands();
  @GET(EndPoints.getProductsApi)
  Future<ProductResponseDto> getAllProducts();
  @POST(EndPoints.addToCartApi)
  Future<AddCartResponseDto> addToCart(
      @Body() AddProductRequestDto productRequest,
      @Header("token") String token
      );
  @GET(EndPoints.addToCartApi)
  Future<GetCartResponseDto> getItemsCart(
      @Header("token") String token
      );

  @DELETE(EndPoints.deleteItemsCartApi)
  Future<GetCartResponseDto> deleteItemsCart(
      @Path("productId") String productId,
      @Header("token") String token
      );

  @PUT(EndPoints.deleteItemsCartApi)
  Future<GetCartResponseDto> updateItemsCart(
      @Path("productId") String productId,
      @Header("token") String token,
      @Body() CountRequestDto countRequestDto

      );
}
