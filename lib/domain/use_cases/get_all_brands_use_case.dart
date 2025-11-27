import 'package:e_commerce_app/domain/entities/response/common/category_or_brands.dart';
import 'package:e_commerce_app/domain/repositories/brands/brands_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllBrandsUseCase{
  BrandsRepository brandsRepository;
  GetAllBrandsUseCase({required this.brandsRepository});
  Future<List<CategoryOrBrands>?> invoke(){
    return brandsRepository.getAllBrands();
  }

}