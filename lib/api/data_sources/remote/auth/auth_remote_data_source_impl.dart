import 'package:e_commerce_app/api/api_services.dart';
import 'package:e_commerce_app/api/mappers/auth_response_mapper.dart';
import 'package:e_commerce_app/api/mappers/login_request_mapper.dart';
import 'package:e_commerce_app/api/mappers/register_request_mapper.dart';
import 'package:e_commerce_app/api/model/response/auth_response_dto.dart';
import 'package:e_commerce_app/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:e_commerce_app/domain/entities/request/login_request.dart';
import 'package:e_commerce_app/domain/entities/request/register_request.dart';
import 'package:e_commerce_app/domain/entities/response/auth_response.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:AuthRemoteDataSource )
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  ApiServices apiServices;
  AuthRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<AuthResponse> login(LoginRequest loginRequest) async {
    //todo from loginRequest =>to  loginRequestDto
   var authResponse=await  apiServices.login(loginRequest.toLoginRequestDto());
   //todo from AuthResponseDto =>to  AuthResponse
   return authResponse.toAuthResponse();
  }

  @override
  Future<AuthResponse> register(RegisterRequest registerRequest) async {
    //todo from registerRequest =>to  registerRequestDto

    var authResponse=
    await apiServices.register(registerRequest.toRegisterRequestDto());
    //todo from AuthResponse =>to  AuthResponseDto
    //todo from AuthResponse =>to  AuthResponseDto

    return authResponse.toAuthResponse();
  }

}