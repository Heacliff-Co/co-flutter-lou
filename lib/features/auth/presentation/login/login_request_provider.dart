import 'package:louhie/features/app/data/app_supbase_data_source.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:co_flutter_core/core.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sup;

final loginRequestProvider =
    StateNotifierProvider<LoginRequestProvider, AsyncValue<sup.AuthResponse?>>(
        (ref) {
  return LoginRequestProvider(sl());
});

class LoginRequestProvider
    extends StateNotifier<AsyncValue<sup.AuthResponse?>> {
  final AppSupabaseDataSource _supabaseClient;

  LoginRequestProvider(this._supabaseClient)
      : super(const AsyncValue.data(null));

  void login(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final response = await _supabaseClient.supabaseClient.auth
          .signInWithPassword(password: password, email: email);
      state = AsyncData(response);
    } on sup.AuthException catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    } on ServerException catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}
