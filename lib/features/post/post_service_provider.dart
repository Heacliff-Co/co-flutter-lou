import 'package:louhie/features/post/data/datasource/post_client.dart';
import 'package:louhie/features/post/presentation/cubit/post_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:co_flutter_core/core.dart';

import 'data/models/post.dart';

class PostServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    it.registerFactory(() => PostCubit());
    it.registerFactory(() => PostClient(it()));
  }

  @override
  T? responseConvert<T>(Map<String, dynamic> json) {
    switch (T) {
      case Post:
        return Post.fromJson(json) as T;
      default:
        return null;
    }
  }
}
