import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/app_theme.dart';
import 'features/app/app_bloc.dart';
import 'routes/app_router.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              locale: appBloc.state.currentLocale,
              supportedLocales: const [Locale('ar'), Locale('en')],
              debugShowCheckedModeBanner: true,
              routerDelegate: appRouter.delegate(
                  // navigatorObservers: navigatorObservers,
                  ),
              routeInformationParser: appRouter.defaultRouteParser(),
              theme: appLightThemeData(),
              darkTheme: appDarkThemeData(),
              themeMode: appBloc.state.currentThemeMode,
            ));
  }
}
