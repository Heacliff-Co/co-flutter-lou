import 'package:co_flutter_core/core.dart';
import 'package:get_it/get_it.dart';
import 'package:louhie/features/manga/data/datasource/manga_client.dart';
import 'package:louhie/features/manga/data/model/manga.dart';

class MangaServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    it.registerFactory(() => MangaClient(supabase: it()));
  }

  @override
  T? responseConvert<T>(Map<String, dynamic> json) {
    switch (T) {
      case Manga:
        return Manga.fromJson(json) as T;
      default:
        return null;
    }
  }
}
