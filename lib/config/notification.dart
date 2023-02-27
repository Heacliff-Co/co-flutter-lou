import 'package:louhie/core/app_notification_providers.dart';
import 'package:one_studio_core/core.dart';

class NotificationConfig {
  static var providers = {
    'push_notification': {
      'driver': 'push_notification',
      'class': PushNotificationsProviders,
      'channels': [
        {
          'name': 'firebase_messaging',
          'class': FirebaseMessagingNotificationProvider,
        }
      ],
    },
    'server_notification': {
      'driver': 'notification_center',
      'data_source': {
        'name': 'notification_center_remote_data_source',
        'class': NotificationCenterRemoteDataSource,
      },
      'class': NotificationCenterProvider,
    }
  };
}
