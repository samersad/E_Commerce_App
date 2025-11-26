import 'package:e_commerce_app/data/data_sources/remote/category/category_remote_data_source.dart';
import 'package:e_commerce_app/domain/entities/response/common/category_or_brands.dart';
import 'package:e_commerce_app/domain/repositories/brands/brands_repository.dart';
import 'package:injectable/injectable.dart';

import '../../data_sources/remote/brands/brands_remote_data_source.dart';

@Injectable(as:BrandsRepository )
class BrandsRepositoryImpl implements BrandsRepository{
  BrandsRemoteDataSource remoteDataSource;
  BrandsRepositoryImpl({required this.remoteDataSource});
  @override
  Future<List<CategoryOrBrands>?> getAllBrands() {
    return remoteDataSource.getAllBrands();
  }
}