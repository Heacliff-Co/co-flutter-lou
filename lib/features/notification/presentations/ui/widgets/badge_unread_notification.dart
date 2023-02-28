import 'package:flutter/material.dart';
import 'package:co_flutter_core/core.dart';

class BadgeUnreadNotification extends StatelessWidget {
  const BadgeUnreadNotification({
    this.isRead = false,
    Key? key,
  }) : super(key: key);

  final bool isRead;

  @override
  Widget build(BuildContext context) {
    return !isRead
        ? Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: context.colorScheme.primary,
              shape: BoxShape.circle,
            ),
          )
        : const SizedBox.shrink();
  }
}
