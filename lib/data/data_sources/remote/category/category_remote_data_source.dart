import 'package:e_commerce_app/domain/entities/response/common/category_or_brands.dart';

abstract class CategoryRemoteDataSource{
  Future<List<CategoryOrBrands>?> getAllCategories();
}