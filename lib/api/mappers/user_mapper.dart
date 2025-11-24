import 'package:e_commerce_app/api/model/response/user_dto.dart';

import '../../domain/entities/response/user.dart';

extension UserMapper on UserDto {
  User toUser(){
    return User(
      email: email,
      name: name,
      role: role
    );
  }
}