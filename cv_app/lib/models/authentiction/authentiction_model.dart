import 'package:cv_app/models/authentiction/authentiction_data_model.dart';

class AuthentictionModel {
  AuthentictionModel({
    required this.msg,
    required this.data,
    required this.codeState,
  });
  late  String msg;
  late  AuthentictionData data;
  late  int codeState;

  AuthentictionModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = AuthentictionData.fromJson(json['data']);
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
