import 'package:e_commerce_app/data/data_sources/remote/favorite/favorite_remote_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/response/favorite/add_to_favorite.dart';
import '../../../domain/repositories/favorite/favorite_repository.dart';
@Injectable(as: FavoriteRepository)
 class FavoriteRepositoryImpl extends FavoriteRepository{
  FavoriteRemoteDataSource remoteDataSource;
  FavoriteRepositoryImpl({required this.remoteDataSource});

  @override
  Future<AddToFavorite> addProductToFavorite(String productId) {
   return remoteDataSource.addProductToFavorite(productId);
  }

}