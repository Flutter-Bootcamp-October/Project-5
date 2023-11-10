class ErrorModel {
  ErrorModel({
    required this.msg,
    required this.codeState,
  });
  late final String msg;
  late final int codeState;

  ErrorModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    codeState = json['codeState'];
  }
}
