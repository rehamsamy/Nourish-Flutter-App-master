class LoginModel {
  LoginModel({
      this.data,});

  LoginModel.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    error=(json['error'] != null ? Data.fromJson(json['error']) : null) as String?;
  }
  Data? data;
  String?error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.msg,});

  Data.fromJson(dynamic json) {
    msg = json['msg'];
  }
  String? msg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['msg'] = msg;
    return map;
  }

}