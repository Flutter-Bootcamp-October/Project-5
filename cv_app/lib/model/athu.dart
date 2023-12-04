// class AuthModel {
//   AuthModel({
//     required this.msg,
//     required this.data,
//     required this.codeState,
//   });
//   late final String msg;
//   late final Data data;
//   late final int codeState;

//   AuthModel.fromJson(Map<String, dynamic> json) {
//     msg = json['msg'];
//     data = Data.fromJson(json['data']);
//     codeState = json['codeState'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['msg'] = msg;
//     _data['data'] = data.toJson();
//     _data['codeState'] = codeState;
//     return _data;
//   }
// }

// class Data {
//   Data({
//     required this.email,
//   });
//   late final String email;

//   Data.fromJson(Map<String, dynamic> json) {
//     email = json['email'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['email'] = email;
//     return _data;
//   }
// }
