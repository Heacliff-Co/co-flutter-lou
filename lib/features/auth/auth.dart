library auth;

import 'package:louhie/features/app/data/app_supbase_data_source.dart';
import 'package:louhie/features/auth/data/datasource/auth_http_client.dart';
import 'package:co_flutter_core/core.dart';

import 'data/models/user.dart';

export 'data/models/user.dart';
export 'data/models/user_meta.dart';
export 'presentation/login/login_page.dart';
export 'presentation/logout/logout_cubit.dart';
export 'presentation/register/register_page.dart';
export 'routes.dart';

class Auth {
  static bool check() =>
      sl<AppSupabaseDataSource>().supabaseClient.auth.currentSession != null;

  static User? user() => sl<AuthStore<User>>().user;

  static Future<User?> loginAnonymous() async {
    final response = await sl<AuthHttpClient>().anonymous();
    return response.data;
  }
}
