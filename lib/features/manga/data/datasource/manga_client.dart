import 'dart:convert';

import 'package:co_flutter_core/core.dart';
import 'package:louhie/config/api.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/manga.dart';

class MangaClient {
  final SupabaseClient supabase;
  MangaClient({required this.supabase});

  Future<ListResponse<Manga>> getTrendingManga() async {
    final response = (await supabase
        .from(SupabaseConfig.wdManga)
        .select()
        .order(SupabaseConfig.trending, ascending: false)
        .limit(15));

    List<Manga> mangaList = <Manga>[
      for (final e in response) Manga.fromJson(e)
    ];

    return ListResponse(data: mangaList);
  }
}
