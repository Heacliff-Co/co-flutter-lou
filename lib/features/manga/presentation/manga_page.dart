import 'package:auto_route/auto_route.dart';
import 'package:co_flutter_core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:louhie/core/widgets/app_carousel.dart';
import 'package:louhie/features/main/presentation/main_app_bar.dart';
import 'package:louhie/features/manga/presentation/cubit/manga_cubit.dart';
import 'package:louhie/features/manga/presentation/widgets/manga_item.dart';

class MangaPage extends StatelessWidget with AutoRouteWrapper {
  const MangaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mangaCubit = context.watch<MangaCubit>();
    return Scaffold(
      appBar: const MainAppBar(),
      body: mangaCubit.state.when(
        initial: () => const Center(
            child: CircularProgressIndicator(
          color: Colors.black,
        )),
        success: (mangaList, loading) => SingleChildScrollView(
            child: Column(
          children: [
            if (loading) const CircularProgressIndicator.adaptive(),
            if (!loading)
              AppMangaCarousel(
                height: 180,
                imageWidth: 150,
                list: mangaList,
              ),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              crossAxisCount: 2,
              childAspectRatio: 0.6,
              mainAxisSpacing: 6.0,
              crossAxisSpacing: 6.0,
              children: mangaList.map((e) => MangaItem(manga: e)).toList(),
            ),
          ],
        )),
        failed: (error) => Center(
          child: Text(error),
        ),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<MangaCubit>(
          create: (context) => sl<MangaCubit>()..loadMangaTest())
    ], child: this);
  }
}
