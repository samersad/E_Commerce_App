import 'package:e_commerce_app/api/mappers/user_mapper.dart';
import 'package:e_commerce_app/api/model/response/auth_response_dto.dart';
import 'package:e_commerce_app/core/exception/app_exceptions.dart';
import 'package:e_commerce_app/domain/entities/response/auth_response.dart';

extension  AuthResponseMapper on AuthResponseDto{
  AuthResponse toAuthResponse(){
    if (token!=null|| token!.isNotEmpty ||user!=null) {
      return AuthResponse(
          message:message,
          token: token,
          user:user?.toUser()
      );
    }
    else{
      throw ServerException(message: "fill Auth");
    }

  }
}