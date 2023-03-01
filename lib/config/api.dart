import 'package:louhie/config/environments.dart';

class ApiConfig {
  static String baseUrl = env('API_BASE_URL');
  static int connectTimeout = env('CONNECT_TIMEOUT');
  static int sendTimeout = env('SEND_TIMEOUT');
  static int receiveTimeout = env('RECEIVE_TIMEOUT');
  static bool receiveDataWhenStatusError =
      env('RECEIVE_DATA_WHEN_STATUS_ERROR');
}

class SupabaseConfig {
  SupabaseConfig._();

  static const String prefixDb = "wibudex_";
  static const String wdManga = prefixDb + "manga";
  static const String wdMangaCharacters = prefixDb + "manga_characters";
  static const String wdMangaRecommendations =
      prefixDb + "manga_recommendations";
  static const String wdMangaSource = prefixDb + "manga_source";

  //Column

  static const String trending = "trending";
}
