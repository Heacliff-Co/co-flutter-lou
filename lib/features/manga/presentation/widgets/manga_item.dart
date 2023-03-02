import 'package:flutter/material.dart';
import 'package:louhie/features/manga/data/model/manga.dart';

class MangaItem extends StatelessWidget {
  const MangaItem({super.key, required this.manga});

  final Manga manga;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: GestureDetector(
        onTap: () {},
        child: Hero(
          tag: 5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              manga.coverImage?.large ?? "",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
