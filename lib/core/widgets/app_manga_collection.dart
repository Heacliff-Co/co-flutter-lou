import 'package:flutter/material.dart';
import 'package:louhie/core/widgets/app_network_image.dart';
import 'package:louhie/core/widgets/atom/full_ripple.dart';
import 'package:louhie/features/manga/data/model/manga.dart';

enum MangaCollectionType {
  rankings,
  updates,
  histories,
  shelves,
  downloads,
}

class AppMangaCollection extends StatefulWidget {
  const AppMangaCollection(
      {Key? key, required this.type, required this.mangaList})
      : super(key: key);

  @override
  State<AppMangaCollection> createState() => _AppMangaCollectionState();

  final MangaCollectionType type;
  final List<Manga> mangaList;
}

class _AppMangaCollectionState extends State<AppMangaCollection>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    switch (widget.type) {
      case MangaCollectionType.rankings:
        break;
      default:
    }
    return Container();
  }

  // Widget _buildRankItem(BuildContext context, Manga manga) {
  //   final width =
  //       (MediaQuery.of(context).size.width - 15 * 3) / 2.5; // | ▢ ▢ ▢|
  //   final height = width / 3 * 4;

  //   return Column(
  //     children: [
  //       _buildCover(context, manga.id, manga.title?.vietnamese ?? "", "",
  //           manga.coverImage?.medium ?? "", width, height)
  //     ],
  //   );
  // }

  // Widget _buildCover(BuildContext context, int mid, String title, String url,
  //     String cover, double width, double height) {
  //   return FullRippleWidget(
  //     radius: BorderRadius.circular(8),
  //     highlightColor: null,
  //     splashColor: null,
  //     onTap: () {},
  //     child: SizedBox(
  //       width: width,
  //       height: height,
  //       child: AppNetworkImage(
  //         url: cover,
  //         width: width,
  //         height: height,
  //         radius: BorderRadius.circular(8),
  //         border: Border.all(width: 0.7, color: Colors.grey[400]!),
  //       ),
  //     ),
  //   );
  // }

  @override
  bool get wantKeepAlive => true;
}
