import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:louhie/core/theme/app_style.dart';

class AppLoaddingWidget extends StatelessWidget {
  const AppLoaddingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: AppStyle.edgeInsetsA12,
        child: LottieBuilder.asset(
          'assets/lotties/loadding.json',
          width: 200.w,
        ),
      ),
    );
  }
}
