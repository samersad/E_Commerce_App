import 'package:e_commerce_app/domain/entities/response/product/product.dart';

abstract class ProductRepository{
  Future<List<Product>?> getAllProducts();
}