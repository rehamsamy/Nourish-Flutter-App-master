import 'package:nourish_sa/app/data/models/profile_model.dart';

class UpdateProfileModel {
  UpdateProfileModel({
    this.data,
  });

  UpdateProfileModel.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Data? data;

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
    this.user,
    this.msg,
  });

  Data.fromJson(dynamic json) {
    user = json['user'] != null ? ProfileModel.fromJson(json['user']) : null;
    msg = json['msg'];
  }
  ProfileModel? user;
  String? msg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['msg'] = msg;
    return map;
  }
}
