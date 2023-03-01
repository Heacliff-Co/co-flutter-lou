import 'dart:convert';

import 'package:louhie/config/api.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/manga.dart';

class MangaClient {
  final SupabaseClient supabase;
  MangaClient({required this.supabase});

  Future<List<Manga>> getTrendingManga() async {
    final response = (await supabase
        .from(SupabaseConfig.wdManga)
        .select()
        .order(SupabaseConfig.trending, ascending: false)
        .limit(15));
    return <Manga>[for (final e in response) Manga.fromJson(e)];
  }
}
