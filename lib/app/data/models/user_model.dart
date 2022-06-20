class UserModel {
  UserModel({
    this.id,
    this.nameEn,
    this.email,
    this.emailVerifiedAt,
    this.type,
    this.nameAr,
    this.image,
    this.status,
    this.mobile,
    this.smsCode,
    this.emailVerifyCode,
    this.verified,
    this.locale,
    this.deviceToken,
    this.name,
    this.firstName,
    this.lastName,
    this.additionalData,});

  UserModel.fromJson(dynamic json) {
    id = json['id'];
    nameEn = json['name_en'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    type = json['type'];
    nameAr = json['name_ar'];
    image = json['image'];
    status = json['status'];
    mobile = json['mobile'];
    smsCode = json['sms_code'];
    emailVerifyCode = json['email_verify_code'];
    verified = json['verified'];

    locale = json['locale'];
    deviceToken = json['device_token'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    additionalData = json['additional_data'];
  }
  int? id;
  String? nameEn;
  String? email;
  String? emailVerifiedAt;
  String? type;
  String? nameAr;
  String? image;
  int? status;
  String? mobile;
  dynamic smsCode;
  dynamic emailVerifyCode;
  int? verified;
  dynamic locale;
  dynamic deviceToken;
  String? name;
  String? firstName;
  String? lastName;
  dynamic additionalData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name_en'] = nameEn;
    map['email'] = email;
    map['email_verified_at'] = emailVerifiedAt;
    map['type'] = type;
    map['name_ar'] = nameAr;
    map['image'] = image;
    map['status'] = status;
    map['mobile'] = mobile;
    map['sms_code'] = smsCode;
    map['email_verify_code'] = emailVerifyCode;
    map['verified'] = verified;
    map['locale'] = locale;
    map['device_token'] = deviceToken;
    map['name'] = name;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['additional_data'] = additionalData;
    return map;
  }

}