// @module
import 'package:dio/dio.dart';
import 'package:e_commerce_app/api/api_services.dart';
import 'package:e_commerce_app/api/dio/dio_interceptor.dart';
import 'package:e_commerce_app/api/end_points.dart';
import "package:injectable/injectable.dart";
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class GetItModule {
  @singleton //create one time in app
  @injectable
  BaseOptions provideBaseOptions() {
    return BaseOptions(
      baseUrl: EndPoints.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 10),
    );
  }

  @singleton
  @injectable
  PrettyDioLogger providePrettyDioLogger() {
    return PrettyDioLogger(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true,
    );
  }
  @singleton
  @injectable
  Dio provideDio(BaseOptions baseOptions, PrettyDioLogger prettyDioLogger) {
    var dio = Dio(baseOptions);
    //todo interceptors
    dio.interceptors.add(DioInterceptor());
    dio.interceptors.add(PrettyDioLogger());
    dio.interceptors.add(prettyDioLogger);
    return dio;
  }
  @singleton
  @injectable
  ApiServices provideApiServices(Dio dio)=>ApiServices(dio);
}
