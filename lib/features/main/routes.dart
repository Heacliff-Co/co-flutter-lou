import 'package:auto_route/auto_route.dart';
import 'package:louhie/features/collections/presentation/collections_page.dart';
import 'package:louhie/features/main/presentation/main_page.dart';
import 'package:louhie/features/manga/presentation/manga_page.dart';
import 'package:louhie/features/more/presentation/more_page.dart';
import 'package:louhie/features/post/presentation/home_page.dart';

const mainRoutes = <AutoRoute>[
  AutoRoute(
    page: MainPage,
    initial: true,
    children: [
      AutoRoute(page: HomePage),
      AutoRoute(page: CollectionsPage),
      AutoRoute(page: MorePage),
      AutoRoute(page: MangaPage)
    ],
  ),
];
