class UpdateAppDefaultValue {
  static const Map<String, dynamic> defaultParameters = {
    'appCurrentVersion':
        '{"ios":{"minVersion":1,"maxVersion":1,"message":"Bảo vệ quyền riêng tư của bạn và có được trải nghiệm người dùng tốt nhất là ưu tiên hàng đầu của chúng tôi, vui lòng cập nhật lên phiên bản hiện tại của bạn"},"android":{"minVersion":1,"maxVersion":1,"message":"Bảo vệ quyền riêng tư của bạn và có được trải nghiệm người dùng tốt nhất là ưu tiên hàng đầu của chúng tôi, vui lòng cập nhật lên phiên bản hiện tại của bạn"}}'
  };
  static const fetchTimeout = Duration(minutes: 1);
  static const minimumFetchInterval = Duration(minutes: 5);
}
