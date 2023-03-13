import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:louhie/core/observers/nav_observer.dart';

import 'core/app_theme.dart';
import 'features/app/app_bloc.dart';
import 'routes/app_router.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class BondApp extends StatelessWidget {
  const BondApp({Key? key, required this.appRouter}) : super(key: key);

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    final appBloc = context.watch<AppBloc>();
    return ScreenUtilInit(
        designSize: ScreenUtil.defaultSize,
        builder: (context, child) => MaterialApp.router(
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                AppLocalizations.delegate,
              ],
              scrollBehavior: AppScrollBehavior(),
              locale: appBloc.state.currentLocale,
              supportedLocales: const [Locale('ar'), Locale('en')],
              debugShowCheckedModeBanner: true,
              routerDelegate: AutoRouterDelegate(
                appRouter,
                navigatorObservers: () => <NavigatorObserver>[
                  NavObserver(),
                  FlutterSmartDialog.observer,
                  FirebaseAnalyticsObserver(
                    analytics: FirebaseAnalytics.instance,
                    nameExtractor: (routeSettings) =>
                        routeSettings.name?.replaceAll('Route', ''),
                  ),
                ],
              ),
              routeInformationParser: appRouter.defaultRouteParser(),
              theme: appLightThemeData(),
              darkTheme: appDarkThemeData(),
              themeMode: appBloc.state.currentThemeMode,
              builder: FlutterSmartDialog.init(),
            ));
  }
}
