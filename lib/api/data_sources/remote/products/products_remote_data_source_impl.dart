import 'package:dio/dio.dart';
import 'package:e_commerce_app/api/api_services.dart';
import 'package:e_commerce_app/api/mappers/products_mapper.dart';
import 'package:e_commerce_app/core/exception/app_exceptions.dart';
import 'package:e_commerce_app/data/data_sources/remote/products/products_remote_data_source.dart';
import 'package:e_commerce_app/domain/entities/response/product/product.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: ProductsRemoteDataSource)
class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource{
  ApiServices apiServices;
  ProductsRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<List<Product>?> getAllProducts()async {
    try{
      var productsResponse=await apiServices.getAllProducts();
      return productsResponse.data?.map((productDto) =>productDto.toProduct()).toList()??[];
    }
    on DioException catch(e){
      String message=(e.error  as AppExceptions).message;
      throw ServerException(message: message);
    }
  }
}