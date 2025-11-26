import 'package:e_commerce_app/domain/entities/response/common/category_or_brands.dart';

abstract class BrandsRepository{
  Future<List<CategoryOrBrands>?> getAllBrands();
}