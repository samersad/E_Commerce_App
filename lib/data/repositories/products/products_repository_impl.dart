import 'package:e_commerce_app/data/data_sources/remote/category/category_remote_data_source.dart';
import 'package:e_commerce_app/domain/entities/response/common/category_or_brands.dart';
import 'package:e_commerce_app/domain/entities/response/product/product.dart';
import 'package:e_commerce_app/domain/repositories/brands/brands_repository.dart';
import 'package:e_commerce_app/domain/repositories/product/product_repository.dart';
import 'package:injectable/injectable.dart';

import '../../data_sources/remote/brands/brands_remote_data_source.dart';
import '../../data_sources/remote/products/products_remote_data_source.dart';

@Injectable(as:ProductRepository )
class ProductsRepositoryImpl implements ProductRepository{
  ProductsRemoteDataSource remoteDataSource;
  ProductsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Product>?> getAllProducts() {
   return remoteDataSource.getAllProducts();
  }


}