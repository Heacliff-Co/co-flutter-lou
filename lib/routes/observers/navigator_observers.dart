library navigator_observers;

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:louhie/core/app_observer.dart';

List<RouteObserver> navigatorObservers() => [
      FirebaseAnalyticsObserver(
        analytics: FirebaseAnalytics.instance,
        nameExtractor: (routeSettings) =>
            routeSettings.name?.replaceAll('Route', ''),
      ),
    ];
