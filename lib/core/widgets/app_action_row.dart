import 'package:co_flutter_core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:louhie/core/widgets/icon_text.dart';

class ActionItem {
  const ActionItem(
      {required this.text,
      required this.icon,
      required this.action,
      this.longPress,
      this.enable = true,
      this.rotateAngle = 0});

  const ActionItem.simple(this.text, this.icon, this.action,
      {this.longPress, this.enable = true, this.rotateAngle = 0});

  final String text;
  final IconData icon;
  final void Function()? action;
  final void Function()? longPress;
  final bool enable;
  final double rotateAngle;
}

class AppActionRow extends StatelessWidget {
  const AppActionRow.four({
    Key? key,
    required this.action1,
    required this.action2,
    required this.action3,
    required this.action4,
    this.compact = false,
    this.textColor,
    this.iconColor,
    this.disabledTextColor,
    this.disabledIconColor,
    this.iconBuilder,
  })  : action5 = null,
        super(key: key);

  const AppActionRow.five({
    Key? key,
    required this.action1,
    required this.action2,
    required this.action3,
    required this.action4,
    required ActionItem this.action5,
    this.compact = false,
    this.textColor,
    this.iconColor,
    this.disabledTextColor,
    this.disabledIconColor,
    this.iconBuilder,
  }) : super(key: key);

  final ActionItem action1;
  final ActionItem action2;
  final ActionItem action3;
  final ActionItem action4;
  final ActionItem? action5;
  final bool compact;
  final Color? textColor;
  final Color? iconColor;
  final Color? disabledTextColor;
  final Color? disabledIconColor;
  final Widget Function(ActionItem action)? iconBuilder;

  Widget _buildAction(BuildContext context, ActionItem action) {
    return InkWell(
      onTap: action.enable ? action.action : null,
      onLongPress: action.enable ? action.longPress : null,
      child: Padding(
        padding: compact
            ? EdgeInsets.symmetric(vertical: 2.h) // compact
            : EdgeInsets.symmetric(vertical: 5.h) /* normal */,
        child: IconText(
          alignment: IconTextAlignment.t2b,
          space: compact
              ? 2 // compact
              : 8 /* normal */,
          icon: iconBuilder?.call(action) ??
              Transform.rotate(
                angle: action.rotateAngle,
                child: Icon(
                  action.icon,
                ),
              ),
          text: Text(
            action.text,
            style: context.textTheme.bodyText1!.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: compact
            ? const EdgeInsets.symmetric(horizontal: 0, vertical: 0) // compact
            : const EdgeInsets.symmetric(
                horizontal: 0, vertical: 8) /* normal */,
        child: Row(
          mainAxisAlignment: compact
              ? MainAxisAlignment.spaceAround // compact
              : MainAxisAlignment.spaceEvenly /* normal */,
          children: [
            _buildAction(context, action1),
            _buildAction(context, action2),
            _buildAction(context, action3),
            _buildAction(context, action4),
            if (action5 != null) // five
              _buildAction(context, action5!),
          ],
        ),
      ),
    );
  }
}
