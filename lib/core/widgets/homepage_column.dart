import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:louhie/core/widgets/atom/icon_text.dart';

class HomepageColumn extends StatelessWidget {
  const HomepageColumn(
      {Key? key,
      required this.title,
      required this.icon,
      required this.child,
      this.onMorePressed,
      this.padding = const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      this.headerChildSpace})
      : super(key: key);

  final String title;
  final IconData icon;
  final Widget child;
  final void Function()? onMorePressed;
  final EdgeInsets padding;
  final double? headerChildSpace;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: padding.left,
                    top: padding.top,
                    bottom: headerChildSpace ?? padding.top),
                child: IconText(
                  icon: Icon(icon, size: 25, color: Colors.orange),
                  text:
                      Text(title, style: Theme.of(context).textTheme.subtitle1),
                  space: 8,
                ),
              ),
              if (onMorePressed != null)
                Padding(
                  padding: EdgeInsets.only(
                      right: padding.right - 5,
                      top: (headerChildSpace ?? 0) / 2),
                  child: InkWell(
                    onTap: onMorePressed,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 5, top: 4, bottom: 4),
                      child: IconText(
                        text: Text(
                          'Xem thêm',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(color: Colors.orange),
                        ),
                        icon: const Icon(
                          Icons.double_arrow,
                          size: 20,
                          color: Colors.orange,
                        ),
                        alignment: IconTextAlignment.r2l,
                        space: 2,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          child,
          SizedBox(height: padding.bottom),
        ],
      ),
    );
  }
}
