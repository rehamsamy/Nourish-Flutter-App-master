import 'package:nourish_sa/app/data/models/user_model.dart';

class VerifyEmailModel {
  VerifyEmailModel({
      this.accessToken, 
      this.tokenType, 
      this.user, 
      this.expiresIn,});

  VerifyEmailModel.fromJson(dynamic json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    expiresIn = json['expires_in'];
  }
  String? accessToken;
  String? tokenType;
  UserModel? user;
  int? expiresIn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = accessToken;
    map['token_type'] = tokenType;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['expires_in'] = expiresIn;
    return map;
  }

}

