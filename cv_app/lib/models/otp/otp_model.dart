class OTPData {
  OTPData({
    required this.token,
    required this.email,
    required this.otp,
    required this.type,
  });
  late String token;
  late String otp;
  late String email;
  late String type;

  OTPData.fromJson(Map<String, dynamic> json) {
    token = json['token'] ?? '';
    otp = json['otp'] ?? '';
    email = json['email'] ?? '';
    type = json['type'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['token'] = token;
    _data['otp'] = otp;
    _data['email'] = email;
    _data['type'] = type;
    return _data;
  }
}
