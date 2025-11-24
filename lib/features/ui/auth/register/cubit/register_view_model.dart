import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/exception/app_exceptions.dart';
import 'package:e_commerce_app/domain/entities/request/register_request.dart';
import 'package:e_commerce_app/domain/use_cases/login_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/register_use_case.dart';
import 'package:e_commerce_app/features/ui/auth/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/entities/request/login_request.dart';

@injectable
class RegisterViewModel extends Cubit<AuthStates> {
  RegisterUseCase registerUseCase;
  TextEditingController fullNameCtrl = TextEditingController(text: "samer saad");

  TextEditingController emailCtrl = TextEditingController(text: "samer@gmail.com");

  TextEditingController passwordCtrl = TextEditingController(text: "Samer@1234");
  TextEditingController rePasswordCtrl = TextEditingController(text: "Samer@1234");
  TextEditingController phoneNumberCtrl = TextEditingController(text: "01283950353");


  RegisterViewModel({required this.registerUseCase})
    : super(AuthLoadingState());
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  Future<void> register() async {
    try {
      if (formkey.currentState?.validate() == true) {
        emit(AuthLoadingState());
        RegisterRequest registerRequest = RegisterRequest(
          password: passwordCtrl.text,
          email: emailCtrl.text,
          phone: phoneNumberCtrl.text,
          name: fullNameCtrl.text,
          rePassword: rePasswordCtrl.text
        );
        var authResponse = await registerUseCase.invoke(registerRequest);
        emit(AuthSuccessState(authResponse: authResponse));
      }
    } on AppExceptions catch (e) {
      emit(AuthErrorState(errorMessage: e.message));
    } on DioException catch (e) {
      final message = (e.error is AppExceptions)
          ? (e.error as AppExceptions).message
          : "UnExpected Error";
      emit(AuthErrorState(errorMessage: message));
    }
  }
}

//view =>viewModel
// viewModel =>use case
// use case => repository
// repository => data source
// data source => api services
