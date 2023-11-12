import 'package:cv_app/models/delete_account/delete_account_data_model.dart';

class DeleteAccountModel {
  DeleteAccountModel({
    required this.msg,
    required this.data,
    required this.codeState,
  });
  late final String msg;
  late final DeleteAccountData data;
  late final int codeState;

  DeleteAccountModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = DeleteAccountData.fromJson(json['data']);
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
