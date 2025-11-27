import 'package:dio/dio.dart';
import 'package:e_commerce_app/api/api_services.dart';
import 'package:e_commerce_app/api/mappers/category_mapper.dart';
import 'package:e_commerce_app/core/exception/app_exceptions.dart';
import 'package:e_commerce_app/data/data_sources/remote/brands/brands_remote_data_source.dart';
import 'package:e_commerce_app/data/data_sources/remote/category/category_remote_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/entities/response/common/category_or_brands.dart';

@Injectable(as: BrandsRemoteDataSource)
 class BrandsRemoteDataSourceImpl implements BrandsRemoteDataSource{
   ApiServices apiServices;
   BrandsRemoteDataSourceImpl({required this.apiServices});
  @override
  Future<List<CategoryOrBrands>?> getAllBrands() async {
    try{
      var brandsResponse=await apiServices.getAllBrands();
          return brandsResponse.data?.map((catDto) =>catDto.toCategoryOrBrands()).toList()??[];
    }
    on DioException catch(e){
          String message=(e.error  as AppExceptions).message;
          throw ServerException(message: message);
        }
  }
}