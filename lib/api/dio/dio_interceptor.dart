import 'package:dio/dio.dart';

import '../../core/exception/app_exceptions.dart';

class DioInterceptor extends Interceptor{
  // @override
  // void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
  //   // TODO: implement onRequest
  //   print(options.baseUrl);
  //   options.headers.addAll({
  //     "X-Api-Key":ApiConstants.apiKey
  //   });
  //   super.onRequest(options, handler);
  // }
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    print(response.statusCode);
    super.onResponse(response, handler);
  }
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    AppExceptions exceptions;
    // TODO: implement onError
    final responseData=err.response?.data;
    String message="Something went wrong, please try again";
    try{
      if (responseData is Map) {
        message = (responseData['errors' ]? ['msg' ] as String?) ??
            (responseData['message'] as String?) ??
            message;
        }
      if (err.type == DioExceptionType.connectionError ||
      err.type == DioExceptionType. connectionTimeout) {
        exceptions = NetworkException(message: 'No internet connection') ;
      } else if (err.response ?. statusCode != null) {
        exceptions = ServerException(
            message: message,
            statusCode: err.response!.statusCode
        );
      }
      else {
        exceptions = UnexpectedException(message: message);
      }
      

        handler.next(DioException(
            requestOptions: err.requestOptions,error: exceptions));
      
    }catch(e){
      message="An unexpected error occurred:${e.toString()}";
    }
  }
  }
