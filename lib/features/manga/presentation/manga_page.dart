import 'package:auto_route/auto_route.dart';
import 'package:co_flutter_core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:louhie/core/widgets/app_action_row.dart';
import 'package:louhie/core/widgets/app_carousel.dart';
import 'package:louhie/core/widgets/app_manga_collection.dart';
import 'package:louhie/features/main/presentation/main_app_bar.dart';
import 'package:louhie/features/manga/data/model/manga.dart';
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
        success: (mangaList, loading) => !loading
            ? SingleChildScrollView(
                child: Column(
                children: [
                  AppMangaCarousel(
                    height: 180.h,
                    imageWidth: 150.w,
                    list: mangaList.take(3).toList(),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Column(children: [
                    AppActionRow.four(
                        action1: ActionItem.simple(
                            "Yêu thích", Icons.star_outline, () {}),
                        action2:
                            ActionItem.simple("Lịch sử", Icons.history, () {}),
                        action3: ActionItem.simple(
                          "Tải xuống",
                          Icons.download,
                          () {},
                        ),
                        action4: ActionItem.simple(
                            "Ngẫu nhiên", Icons.shuffle, () {})),
                    AppActionRow.four(
                        action1:
                            ActionItem.simple("Mới nhất", Icons.cached, () {}),
                        action2:
                            ActionItem.simple("BXH", Icons.trending_up, () {}),
                        action3: ActionItem.simple(
                            "Thể loại", Icons.category, () {}),
                        action4: ActionItem.simple(
                            "Xem website", Icons.open_in_browser, () {}))
                  ]),
                  _buildCollection(
                      context, MangaCollectionType.rankings, mangaList),
                ],
              ))
            : const CircularProgressIndicator.adaptive(),
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

  Widget _buildCollection(
      BuildContext context, MangaCollectionType type, List<Manga> mangaList) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: AppMangaCollection(
        type: type,
        mangaList: mangaList,
      ),
    );
  }
}
