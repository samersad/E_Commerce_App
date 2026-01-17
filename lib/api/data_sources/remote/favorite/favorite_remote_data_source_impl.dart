import 'package:dio/dio.dart';
import 'package:e_commerce_app/api/api_services.dart';
import 'package:e_commerce_app/api/model/request/productid_request_dto.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/cache/shared_prefs_helper.dart';
import '../../../../core/exception/app_exceptions.dart';
import '../../../../data/data_sources/remote/favorite/favorite_remote_data_source.dart';
import '../../../../domain/entities/response/favorite/add_to_favorite.dart';
import '../../../mappers/add_product_favorite_mapper.dart';

@Injectable(as: FavoriteRemoteDataSource)
class FavoriteRemoteDataSourceImpl implements FavoriteRemoteDataSource {
  ApiServices apiServices;

  FavoriteRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<AddToFavorite> addProductToFavorite(String productId) async {
    try {
      String? token = SharedPrefsHelper.getData(key: "token") as String;
      ProductIdRequestDto productIdRequestDto = ProductIdRequestDto(
        productId: productId,
      );
      var addProductToFavoriteResponse = await apiServices.addProductToFavorite(
          token ?? '',
          productIdRequestDto
      );
      //todo addCartResponseDto to AddCartResponse
      //todo AddToFavoriteDto to AddToFavorite
      return addProductToFavoriteResponse.toAddFavorite();
    } on DioException catch (e) {
      String message = (e.error as AppExceptions).message;
      throw ServerException(message: message);
    }
  }
}
