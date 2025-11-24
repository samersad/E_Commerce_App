import 'package:e_commerce_app/api/model/request/register_request_dto.dart';
import 'package:e_commerce_app/domain/entities/request/register_request.dart';

extension RegisterRequestMapper on RegisterRequest{  //هتروح علي RegisterRequest  و تزود toRegisterRequestDto دي من نوع RegisterRequestDto
 RegisterRequestDto  toRegisterRequestDto(){
   return RegisterRequestDto(
     name: name,
     email: email,
     password: password,
     phone: phone,
     rePassword: rePassword
   );
 }
}