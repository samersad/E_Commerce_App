import 'package:e_commerce_app/api/model/request/login_request_dto.dart';
import 'package:e_commerce_app/api/model/response/auth_response_dto.dart';
import 'package:e_commerce_app/domain/entities/request/login_request.dart';

import '../../domain/entities/response/auth_response.dart';

extension LoginRequestMapper on LoginRequest{   //هتروح عليLoginRequest و تزود toLoginRequestDto دي من نوع LoginRequestDto
  LoginRequestDto toLoginRequestDto(){
    return LoginRequestDto(
      email: email,
      password: password
    );
  }
}
