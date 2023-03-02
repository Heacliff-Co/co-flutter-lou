import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:co_flutter_core/core.dart';
import 'package:flutter/material.dart';
import 'package:louhie/core/widgets/app_network_image.dart';
import 'package:louhie/features/manga/data/model/manga.dart';

class AppMangaCarousel extends StatefulWidget {
  const AppMangaCarousel(
      {Key? key,
      required this.list,
      required this.height,
      required this.imageWidth,
      this.onPress})
      : super(key: key);

  final List<Manga> list;
  final double height;
  final double imageWidth;
  final void Function()? onPress;

  @override
  _AppMangaCarouselState createState() => _AppMangaCarouselState();
}

class _AppMangaCarouselState extends State<AppMangaCarousel>
    with AutomaticKeepAliveClientMixin {
  var _currentIndex = 0;
  final _key = const PageStorageKey(0);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            pageViewKey: _key,
            height: widget.height,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 4),
            autoPlayCurve: Curves.fastOutSlowIn,
            onPageChanged: (i, _) {
              _currentIndex = i;
              if (mounted) setState(() {});
            },
            enableInfiniteScroll: true,
            viewportFraction: 1,
          ),
          itemCount: widget.list.length,
          itemBuilder: (c, i, _) => Container(
            color: Colors.white,
            child: Stack(
              children: [
                ClipRect(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: widget.height,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          widget.list[i].coverImage?.large ?? "",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 16,
                        sigmaY: 16,
                      ),
                      child: Container(
                        color: Colors.white.withOpacity(0.75),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Center(
                    child: AppNetworkImage(
                      url: widget.list[i].coverImage?.large ?? "", // 3:4
                      height: widget.height,
                      width: widget.imageWidth,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding:
                const EdgeInsets.only(left: 8, right: 10, top: 4, bottom: 4),
            color: context.colorScheme.onSecondary.withOpacity(0.75),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      '《${widget.list[_currentIndex].title?.vietnamese}》${widget.list[_currentIndex].updatedAt}',
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.titleMedium,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.list.map(
                      (p) {
                        var chose = _currentIndex == widget.list.indexOf(p);
                        return Container(
                          width: chose ? 10 : 8,
                          height: chose ? 10 : 8,
                          margin: const EdgeInsets.symmetric(horizontal: 2.5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: chose
                                ? context.colorScheme.onPrimary
                                : context.colorScheme.onPrimary
                                    .withOpacity(0.4),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
