import 'package:e_commerce_app/domain/entities/response/common/category_or_brands.dart';
import 'package:e_commerce_app/domain/repositories/category/category_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllCategoriesUseCase{
  CategoryRepository categoryRepository;
  GetAllCategoriesUseCase({required this.categoryRepository});
  Future<List<CategoryOrBrands>?> invoke(){
    return categoryRepository.getAllCategories();
  }

}