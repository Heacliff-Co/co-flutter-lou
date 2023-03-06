import 'package:get_it/get_it.dart';
import 'package:co_flutter_core/core.dart';
import 'package:louhie/features/app/data/app_supbase_data_source.dart';

import 'data/models/user.dart';
import 'data/models/user_meta.dart';
import 'presentation/logout/logout_cubit.dart';

class AuthServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    it.registerLazySingleton(
      () => AuthStore<User>(
        it(),
        User.fromJson,
        (User user) => user.toJson(),
      ),
    );
    // it.registerLazySingleton(() => AppSupabaseDataSource(it()));

    it.registerFactory(() => LogoutCubit(it()));
  }

  @override
  T? responseConvert<T>(Map<String, dynamic> json) {
    switch (T) {
      case User:
        return User.fromJson(json) as T;
      case UserMeta:
        return UserMeta.fromJson(json) as T;
      default:
        return null;
    }
  }
}
