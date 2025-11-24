import '../../../domain/entities/request/login_request.dart';
import '../../../domain/entities/request/register_request.dart';
import '../../../domain/entities/response/auth_response.dart';

abstract class AuthRemoteDataSource{
  Future<AuthResponse> login(LoginRequest loginRequest);
  Future<AuthResponse> register (RegisterRequest registerRequest);
}