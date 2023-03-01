import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/manga.dart';

class MangaClient {
  final Supabase supabase;
  MangaClient({required this.supabase});

  SupabaseClient get supabaseClient => supabase.client;

  Future<List<Manga>> getTrendingManga() async {
    return [];
  }
}
