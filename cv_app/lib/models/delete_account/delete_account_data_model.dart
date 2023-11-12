
class DeleteAccountData {
  DeleteAccountData({
    required this.userID,
  });
  late final int userID;

  DeleteAccountData.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['userID'] = userID;
    return _data;
  }
}
