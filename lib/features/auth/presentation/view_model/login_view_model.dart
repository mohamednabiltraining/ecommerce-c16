import 'package:ecommerce_app/features/auth/domain/entities/auth_result.dart';
import 'package:ecommerce_app/features/auth/domain/usecasae/login_use_case.dart';
import 'package:flutter/material.dart';

enum LoginState { initial, loading, success, error }

class LoginViewModel extends ChangeNotifier {
  final LoginUseCase _loginUseCase;
  LoginViewModel(this._loginUseCase);

  // state
  LoginState _state = LoginState.initial;
  String? _errorMessage;
  AuthResult? _authResult;

  //Getter
  LoginState get state => _state;
  String? get errorMessage => _errorMessage;
  AuthResult? get authResult => _authResult;
  bool get isLoading => _state == LoginState.loading;

  //Method
  Future<void> login(String email, password) async {
    // loading ui
    _state = LoginState.loading;
    _errorMessage = null;
    notifyListeners();

    final result = await _loginUseCase.call(email, password);

    result.fold(
      (failure) {
        _state = LoginState.error;
        _errorMessage = failure.message;
        notifyListeners();
      },
      (authResult) {
        _state = LoginState.success;
        _authResult = authResult;
        notifyListeners();
      },
    );
  }
}

// dataSources -> Repository -> useCase -> Vm ->View
