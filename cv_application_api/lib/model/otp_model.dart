class OTP {
  String? msg;
  OtpData? otpData;
  int? codeState;

  OTP({this.msg, this.otpData, this.codeState});

  OTP.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    otpData = json['data'] != null ? new OtpData.fromJson(json['data']) : null;
    codeState = json['codeState'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.otpData != null) {
      data['data'] = this.otpData!.toJson();
    }
    data['codeState'] = this.codeState;
    return data;
  }
}

class OtpData {
  String? token;
  int? expiresAt;
  String? tokenType;
  int? expiresIn;
  String? email;

  OtpData(
      {this.token, this.expiresAt, this.tokenType, this.expiresIn, this.email});

  OtpData.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    expiresAt = json['expiresAt'];
    tokenType = json['tokenType'];
    expiresIn = json['expiresIn'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['expiresAt'] = this.expiresAt;
    data['tokenType'] = this.tokenType;
    data['expiresIn'] = this.expiresIn;
    data['email'] = this.email;
    return data;
  }
}
