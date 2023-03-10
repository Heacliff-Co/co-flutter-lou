import 'dart:developer';

// import 'package:louhie/config/environments.dart';
// import 'package:louhie/features/auth/auth.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:co_flutter_core/core.dart';
import 'package:louhie/core/observers/app_bloc_observer.dart';
import 'package:louhie/features/auth/auth.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:louhie/routes/app_router.dart';
import 'injection_container.dart';

class RunAppTasks extends RunTasks {
  @override
  Future<void> beforeRun(WidgetsBinding widgetsBinding) async {
    Bloc.observer = AppBlocObserver();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    await init();
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    FlutterNativeSplash.remove();
    if (Auth.check()) {
      appRouter.replaceAll([const MainRoute()]);
    }
  }

  @override
  Future<void> afterRun() async {
    if (UniversalPlatform.isAndroid) {
      const AndroidNotificationChannel channel = AndroidNotificationChannel(
        'high_importance_channel', // id
        'Bond', // title
        description:
            'This channel is used for important notifications.', // description
        importance: Importance.max,
      );

      final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
          FlutterLocalNotificationsPlugin();

      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);
    }
    sl<PushNotificationsProviders>().listen();
    if (Auth.check()) {
      // sl<NotificationCenterProvider>().load();
      // sl<NotificationCenterProvider>().listen();

      // final firebaseMessaging =
      //     sl<PushNotificationProvider>(instanceName: 'firebase_messaging');
      // final fcmToken = await firebaseMessaging.token;

      // print(fcmToken);
      //   if (fcmToken != null) {
      //     Map<String, String?> body = {
      //       'device_id': await deviceIdInfo(),
      //       'device_type': getDeviceType(),
      //       'token': fcmToken,
      //     }..removeWhere((key, value) => value == null);
      //     await sl<AuthHttpClient>().updateToken(body);
      //   }
    }
  }

  @override
  void onError(Object error, StackTrace stack) {
    log(stack.toString());
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  }
}
