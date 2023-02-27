import 'package:louhie/core/app_localizations.dart';
import 'package:louhie/routes/app_router.dart';
import 'package:one_studio_core/core.dart';

class FieldBlocValidator {
  FieldBlocValidator._();

  static String? required(String? value) {
    if (value == null || value.isEmpty) {
      return sl<AppRouter>()
          .navigatorKey
          .currentContext
          ?.localizations
          .field_validator_required;
    }
    return null;
  }

  static String? email(String? value) {
    final emailRegExp =
        RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');
    if (value == null || value.isEmpty || emailRegExp.hasMatch(value)) {
      return null;
    }

    return sl<AppRouter>()
        .navigatorKey
        .currentContext
        ?.localizations
        .field_validator_email;
  }

  static String? passwordMin6Chars(String? value) {
    if (value == null || value.isEmpty || value.runes.length >= 6) {
      return null;
    }
    return sl<AppRouter>()
        .navigatorKey
        .currentContext
        ?.localizations
        .field_validator_password;
  }
}
