import 'package:cv_app/models/about/about_data_model.dart';

class AboutModel {
  AboutModel({
    required this.msg,
    required this.data,
    required this.codeState,
  });
  late final String msg;
  late final AboutData data;
  late final int codeState;

  AboutModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = AboutData.fromJson(json['data']);
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
