import 'package:e_commerce_app/domain/entities/response/common/category_or_brands.dart';
import 'package:e_commerce_app/domain/entities/response/product/product.dart';

abstract class ProductsRemoteDataSource{
  Future<List<Product>?> getAllProducts();
}