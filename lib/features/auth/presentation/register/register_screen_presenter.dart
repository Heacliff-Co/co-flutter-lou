import 'package:co_flutter_core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:louhie/core/utils/validator.dart';
import 'package:louhie/features/auth/data/dto/user_dto.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'register_request_provider.dart';

final registerScreenPresenter =
    ChangeNotifierProvider.autoDispose<RegisterScreenPresenter>(
        (ref) => RegisterScreenPresenter());

enum RegisterScreenPresenterState { initial, loading, success, error }

class RegisterScreenPresenter extends ChangeNotifier {
  RegisterScreenPresenterState _registerState =
      RegisterScreenPresenterState.initial;

  RegisterScreenPresenterState get state => _registerState;

  bool get loading => state == RegisterScreenPresenterState.loading;

  bool _isNameValid = true;
  bool _isEmailValid = true;
  bool _isPasswordValid = true;
  bool _isPasswordConfirmationValid = true;

  late AuthResponse authResponse;

  Failure? error;

  String? getNameErrorText(String errorMessage) =>
      _isNameValid ? null : errorMessage;

  String? getEmailErrorText(String errorMessage) =>
      _isEmailValid ? null : errorMessage;

  String? getPasswordErrorText(String errorMessage) =>
      _isPasswordValid ? null : errorMessage;

  String? getPasswordConfirmationErrorText(String errorMessage) =>
      _isPasswordConfirmationValid ? null : errorMessage;
  void register(
    WidgetRef ref, {
    required String email,
    required String name,
    required String password,
    required String passwordConfirmation,
  }) async {
    _isNameValid = Validator.isFullNameValid(name);
    _isEmailValid = Validator.isEmailValid(email);
    _isPasswordValid = Validator.isPasswordValid(password);
    _isPasswordConfirmationValid = password == passwordConfirmation;
    final isValid = _isNameValid &&
        _isEmailValid &&
        _isPasswordValid &&
        _isPasswordConfirmationValid;

    if (isValid) {
      final userDto = UserDto(
        email: email,
        password: password,
        name: name,
        passwordConfirmation: passwordConfirmation,
      );
      _registerState = RegisterScreenPresenterState.loading;

      notifyListeners();

      final response = await ref.watch(registerRequestProvider(userDto).future);
      response.fold((left) {
        _registerState = RegisterScreenPresenterState.success;
        authResponse = left;
      }, (right) {
        _registerState = RegisterScreenPresenterState.error;
        error = right;
      });
    }
    notifyListeners();
  }
}
