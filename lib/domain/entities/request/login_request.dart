import 'package:e_commerce_app/api/model/request/login_request_dto.dart';

class LoginRequest {
  final String? email;
  final String? password;

  LoginRequest({this.email, this.password});

  // LoginRequestDto toLoginRequestDto() {
  //   return LoginRequestDto(email: email, password: password);
  // }
}
