import '../../entities/response/favorite/add_to_favorite.dart';

abstract class FavoriteRepository{

  Future<AddToFavorite> addProductToFavorite(String productId);
}