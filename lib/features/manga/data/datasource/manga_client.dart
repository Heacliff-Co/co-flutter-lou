import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'manga_client.g.dart';

@RestApi(baseUrl: "")
abstract class MangaClient {
  factory MangaClient(Dio dio, {String? baseUrl}) = _MangaClient;
}
