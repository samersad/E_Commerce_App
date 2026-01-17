import '../../../../domain/entities/response/favorite/add_to_favorite.dart';
abstract class FavoriteRemoteDataSource{
  Future<AddToFavorite> addProductToFavorite(String productId);
}