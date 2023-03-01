library app_router;

import 'package:auto_route/auto_route.dart';
import 'package:louhie/features/manga/presentation/manga_page.dart';
import 'package:louhie/features/update_app/routes.dart';
import 'package:louhie/features/auth/auth.dart';
import 'package:louhie/features/notification/presentations/ui/notifications_page.dart';
import 'package:louhie/features/post/presentation/home_page.dart';
import 'package:louhie/routes/guards/auth_guard.dart';
import 'package:louhie/routes/router_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:co_flutter_core/core.dart';

import '../features/collections/presentation/collections_page.dart';
import '../features/main/presentation/main_page.dart';
import '../features/main/routes.dart';
import '../features/more/presentation/more_page.dart';

export 'guards/auth_guard.dart';
export 'observers/navigator_observers.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    ...mainRoutes,
    ...authRoutes,
    ...integrationsRoutes,
    AutoRoute(page: NotificationsPage, guards: [AuthGuard]),
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter(AuthGuard authGuard) : super(authGuard: authGuard);
}

AppRouter get appRouter => sl<AppRouter>();
