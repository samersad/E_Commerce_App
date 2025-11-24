import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/exception/app_exceptions.dart';
import 'package:e_commerce_app/domain/use_cases/login_use_case.dart';
import 'package:e_commerce_app/features/ui/auth/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/entities/request/login_request.dart';

@injectable
class LoginViewModel extends Cubit<AuthStates>{
  LoginUseCase loginUseCase;
  final TextEditingController emailCtrl = TextEditingController(
    text: "samer99@gmail.com",
  );
  final TextEditingController passwordCtrl = TextEditingController(
    text: "Samer@1234",
  );

  LoginViewModel({required this.loginUseCase}):super(AuthLoadingState());
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  
  Future<void> login() async {
    try {
      if (formkey.currentState?.validate() == true) {
        emit(AuthLoadingState());
        LoginRequest loginRequest = LoginRequest(
            email: emailCtrl.text,
            password: passwordCtrl.text,
        );
        var authResponse = await loginUseCase.invoke(loginRequest);
        emit(AuthSuccessState(authResponse: authResponse));
      }
    }
    on AppExceptions catch(e){
      emit(AuthErrorState(errorMessage: e.message));
    }
    on DioException catch(e){
      final message=(e.error is AppExceptions)?
      (e.error as AppExceptions).message :
          "UnExpected Error";
      emit(AuthErrorState(errorMessage:message));
    }


    }


}
//view =>viewModel
// viewModel =>use case
// use case => repository
// repository => data source
// data source => api services