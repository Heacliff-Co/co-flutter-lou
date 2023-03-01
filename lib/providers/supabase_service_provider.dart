import 'package:co_flutter_core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:louhie/config/environments.dart';
import 'package:louhie/features/app/data/app_supbase_data_source.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    final String? supabaseUrl = env("SUPABASE_URL");
    final String? supabaseKey = env("SUPABASE_KEY");

    if (supabaseUrl == null || supabaseKey == null) {
      throw Exception('Missing SUPBASE_URL or SUPBASE_ANON_KEY');
    }
    await Supabase.initialize(
      url: env("SUPABASE_URL"),
      anonKey: env("SUPABASE_KEY"),
      debug: kDebugMode,
      authCallbackUrlHostname: 'login-callback',
    );
    final supabase = Supabase.instance.client;
    it.registerLazySingleton(() => AppSupabaseDataSource(supabase));
  }
}
