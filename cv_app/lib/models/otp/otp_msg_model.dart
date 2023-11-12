import 'package:cv_app/models/otp/otp_model.dart';

class OTPModel {
  OTPModel({
    required this.msg,
    required this.data,
    required this.codeState,
  });
  late final String msg;
  late final OTPData data;
  late final int codeState;

  OTPModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = OTPData.fromJson(json['data']);
    codeState = json['codeState'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['msg'] = msg;
    _data['data'] = data.toJson();
    _data['codeState'] = codeState;
    return _data;
  }
}
