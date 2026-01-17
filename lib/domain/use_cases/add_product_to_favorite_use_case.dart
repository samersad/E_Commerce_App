import 'package:e_commerce_app/domain/entities/response/favorite/add_to_favorite.dart';
import 'package:injectable/injectable.dart';

import '../repositories/favorite/favorite_repository.dart';

@injectable
class AddProductToFavoriteUseCase{
  FavoriteRepository favoriteRepository;
  AddProductToFavoriteUseCase({required this.favoriteRepository});
  Future<AddToFavorite> invoke(String productId){
    return favoriteRepository.addProductToFavorite(productId);
  }

}