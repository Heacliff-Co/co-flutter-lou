import 'dart:convert';

import 'package:louhie/core/app_extensions.dart';
import 'package:louhie/routes/app_router.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:co_flutter_core/core.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'models/current_version.dart';
import 'models/platform_version.dart';

class UpdateAppService {
  UpdateAppService({required this.remoteConfig, required this.packageInfo});

  final FirebaseRemoteConfig remoteConfig;
  final PackageInfo packageInfo;

  void call() async {
    try {
      await remoteConfig.activate();
// Only fetch after a delay to prevent an internal bug from occurring
// See https://github.com/FirebaseExtended/flutterfire/issues/6196
      await Future.delayed(const Duration(seconds: 1));
      await remoteConfig.fetchAndActivate();
      final jsonString = remoteConfig.getString('appCurrentVersion');
      final remoteConfigVersion =
          CurrentVersion.fromJson(json.decode(jsonString));
      final currentVersion = int.tryParse(packageInfo.buildNumber) ?? 0;
      final mustForceUpdate = checkForceUpdate(
        currentVersion,
        remoteConfigVersion.platformVersion,
      );
      if (mustForceUpdate) {
        showForceUpdate(remoteConfigVersion);
      }
    } catch (e) {
      debugPrint('error initRemoteConfig $e');
    }
  }

  void showForceUpdate(CurrentVersion remoteConfigVersion) {
    sl<AppRouter>().off(UpdateAppRoute(message: remoteConfigVersion.message));
  }

  void showSoftUpdate() {
    final jsonString = remoteConfig.getString('appCurrentVersion');
    final remoteConfigVersion =
        CurrentVersion.fromJson(json.decode(jsonString));
    final currentVersion = int.tryParse(packageInfo.buildNumber) ?? 0;
    final isSoftUpdateApp = checkSoftUpdate(
      currentVersion,
      remoteConfigVersion.platformVersion,
    );
    if (isSoftUpdateApp) {
      sl<AppRouter>()
          .push(SoftUpdateRoute(message: remoteConfigVersion.message));
    }
  }

  bool checkForceUpdate(int currentVersion, PlatformVersion platformVersion) =>
      currentVersion < platformVersion.minVersion;

  bool checkSoftUpdate(int currentVersion, PlatformVersion platformVersion) =>
      currentVersion < platformVersion.maxVersion;
}
