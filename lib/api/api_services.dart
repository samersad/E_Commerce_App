import 'package:dio/dio.dart';
import 'package:e_commerce_app/api/end_points.dart';
import 'package:e_commerce_app/api/model/products/product_response_dto.dart';
import 'package:e_commerce_app/api/model/response/auth_response_dto.dart';
import 'package:e_commerce_app/api/model/response/brands/brands_response_dto.dart';
import 'package:e_commerce_app/api/model/response/category/category_response_dto.dart';
import 'package:retrofit/retrofit.dart';

import 'model/request/login_request_dto.dart';
import 'model/request/register_request_dto.dart';

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
}
