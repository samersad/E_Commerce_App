import 'package:dio/dio.dart';
import 'package:e_commerce_app/api/api_services.dart';
import 'package:e_commerce_app/api/mappers/category_mapper.dart';
import 'package:e_commerce_app/core/exception/app_exceptions.dart';
import 'package:e_commerce_app/data/data_sources/remote/category/category_remote_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/response/common/category_or_brands.dart';

@Injectable(as: CategoryRemoteDataSource)
 class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource{
   ApiServices apiServices;
   CategoryRemoteDataSourceImpl({required this.apiServices});
  @override
  Future<List<CategoryOrBrands>?> getAllCategories() async {
    try{
      var categoriesResponse=await apiServices.getAllCategories();
      //todo List<CategoryDto> to List<Category>
      return categoriesResponse.data?.map((catDto) =>catDto.toCategoryOrBrands()).toList()??[];

    }
    on DioException catch(e){
      String message=(e.error  as AppExceptions).message;
      throw ServerException(message: message);
    }
  }
}