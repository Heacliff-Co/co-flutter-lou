import 'package:louhie/providers/notifications_service_provider.dart';
import 'package:co_flutter_core/core.dart';
import 'package:louhie/providers/supabase_service_provider.dart';

import '../features/auth/auth_service_provider.dart';
import '../features/post/post_service_provider.dart';
import '../providers/analytics_service_provider.dart';
import '../providers/api_service_provider.dart';
import '../providers/app_service_provider.dart';
import '../providers/cache_service_provider.dart';
import '../providers/firebase_service_provider.dart';

final List<ServiceProvider> providers = [
  // Framework Service Providers
  FirebaseServiceProvider(),
  AppServiceProvider(),
  AuthServiceProvider(),
  ApiServiceProvider(),
  CacheServiceProvider(),
  AnalyticsServiceProvider(),
  NotificationsServiceProvider(),

  // Supabase
  SupabaseServiceProvider(),

  // Modules Service Providers
  PostServiceProvider(),
];
