import 'package:flutter/material.dart';
import 'package:louhie/core/widgets/homepage_column.dart';
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
  _AppMangaCollectionState createState() => _AppMangaCollectionState();

  final MangaCollectionType type;
  final List<Manga> mangaList;
}

class _AppMangaCollectionState extends State<AppMangaCollection>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    late String title;
    late IconData icon;

    List<Widget>? widgets;
    switch (widget.type) {
      case MangaCollectionType.rankings:
        title = "Rankings";
        icon = Icons.trending_up;
        widgets =
            widget.mangaList.map((e) => _buildRankItem(context, e)).toList();
        break;
      default:
    }
    return Container();
  }

  Widget _buildRankItem(BuildContext context, Manga manga) {
    final width =
        (MediaQuery.of(context).size.width - 15 * 3) / 2.5; // | ▢ ▢ ▢|
    final height = width / 3 * 4;

    return Container();
  }

  @override
  bool get wantKeepAlive => true;
}
