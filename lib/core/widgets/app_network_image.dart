import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class AppNetworkImage extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  final BoxFit fit;
  final BoxBorder? border;
  final BorderRadius? radius;
  const AppNetworkImage(
      {Key? key,
      required this.url,
      required this.width,
      required this.height,
      this.fit = BoxFit.cover,
      this.border,
      this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: border == null
          ? null
          : BoxDecoration(
              border: border,
              borderRadius: radius ?? BorderRadius.zero,
            ),
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: radius ?? BorderRadius.zero,
        child: CachedNetworkImage(
          imageUrl: url,
          width: width,
          height: height,
          fit: fit,
          // httpHeaders: const {
          //   'User-Agent': USER_AGENT,
          //   'Referer': REFERER,
          // },
          placeholder: (context, url) => Container(
            width: width,
            height: height,
            color: Colors.orange[50],
            child: const Center(
              child: Icon(
                Icons.more_horiz,
                color: Colors.grey,
              ),
            ),
          ),
          errorWidget: (_, url, __) => Container(
            width: width,
            height: height,
            color: Colors.orange[50],
            child: const Center(
              child: Icon(
                Icons.broken_image,
                color: Colors.grey,
              ),
            ),
          ),
          cacheManager: DefaultCacheManager(),
          fadeOutDuration: const Duration(milliseconds: 1000),
          fadeOutCurve: Curves.easeOut,
          fadeInDuration: const Duration(milliseconds: 500),
          fadeInCurve: Curves.easeIn,
        ),
      ),
    );
  }
}
