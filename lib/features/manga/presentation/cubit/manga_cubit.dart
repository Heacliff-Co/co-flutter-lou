import 'package:bloc/bloc.dart';
import 'package:co_flutter_core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:louhie/features/app/data/app_supbase_data_source.dart';
import 'package:louhie/features/manga/data/datasource/manga_client.dart';
import 'package:louhie/features/manga/data/model/manga.dart';

part 'manga_state.dart';

class MangaCubit extends Cubit<ListState<Manga>> {
  MangaCubit() : super(ListState.initial()) {
    scrollController.addListener(_scrollControllerListener);
  }

  final ScrollController scrollController = ScrollController();

  final MangaClient? mangaClient =
      MangaClient(supabase: sl<AppSupabaseDataSource>().supabaseClient);

  void _scrollControllerListener() {
    double maxScroll = scrollController.position.maxScrollExtent;
    double currentScroll = scrollController.position.pixels;
    double delta = 200.0;
    if (maxScroll - currentScroll <= delta &&
        state.status != ListStatus.loading) {
      // loadPosts();
    }
  }

  @override
  Future<void> close() async {
    scrollController.dispose();
    scrollController.removeListener(_scrollControllerListener);
    super.close();
  }

  Future<void> loadMangaTest() async {
    emit(state.loading());
    final response = await mangaClient?.getTrendingManga();
    emit(state.success(response ?? const ListResponse(data: [])));
  }
}
