class VerifyEmailModel {
  String? accessToken;
  String? tokenType;
  LoggedUser? user;
  int? expiresIn;

  VerifyEmailModel(
      {this.accessToken, this.tokenType, this.user, this.expiresIn});

  VerifyEmailModel.fromJson(Map<String, dynamic> json) {
    if (json["access_token"] is String) {
      accessToken = json["access_token"];
    }
    if (json["token_type"] is String) {
      tokenType = json["token_type"];
    }
    if (json["user"] is Map) {
      user = json["user"] == null ? null : LoggedUser.fromJson(json["user"]);
    }
    if (json["expires_in"] is int) {
      expiresIn = json["expires_in"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["access_token"] = accessToken;
    data["token_type"] = tokenType;
    if (user != null) {
      data["user"] = user?.toJson();
    }
    data["expires_in"] = expiresIn;
    return data;
  }
}

class LoggedUser {
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
  bool? verified;
  dynamic locale;
  dynamic deviceToken;
  String? name;
  String? firstName;
  String? lastName;
  AdditionalData? additionalData;

  LoggedUser(
      {this.id,
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
      this.additionalData});

  LoggedUser.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["name_en"] is String) {
      nameEn = json["name_en"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["email_verified_at"] is String) {
      emailVerifiedAt = json["email_verified_at"];
    }
    if (json["type"] is String) {
      type = json["type"];
    }
    if (json["name_ar"] is String) {
      nameAr = json["name_ar"];
    }
    if (json["image"] is String) {
      image = json["image"];
    }
    if (json["status"] is int) {
      status = json["status"];
    }
    if (json["mobile"] is String) {
      mobile = json["mobile"];
    }
    smsCode = json["sms_code"];
    emailVerifyCode = json["email_verify_code"];
    if (json["verified"] is bool) {
      verified = json["verified"];
    }
    locale = json["locale"];
    deviceToken = json["device_token"];
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["first_name"] is String) {
      firstName = json["first_name"];
    }
    if (json["last_name"] is String) {
      lastName = json["last_name"];
    }
    if (json["additional_data"] is Map) {
      additionalData = json["additional_data"] == null
          ? null
          : AdditionalData.fromJson(json["additional_data"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name_en"] = nameEn;
    data["email"] = email;
    data["email_verified_at"] = emailVerifiedAt;
    data["type"] = type;
    data["name_ar"] = nameAr;
    data["image"] = image;
    data["status"] = status;
    data["mobile"] = mobile;
    data["sms_code"] = smsCode;
    data["email_verify_code"] = emailVerifyCode;
    data["verified"] = verified;
    data["locale"] = locale;
    data["device_token"] = deviceToken;
    data["name"] = name;
    data["first_name"] = firstName;
    data["last_name"] = lastName;
    if (additionalData != null) {
      data["additional_data"] = additionalData?.toJson();
    }
    return data;
  }
}

class AdditionalData {
  int? id;
  String? gender;
  String? dateOfBirth;
  int? height;
  String? heightUnit;
  int? weight;
  String? weightUnit;
  String? goal;
  String? yourMeals;

  AdditionalData(
      {this.id,
      this.gender,
      this.dateOfBirth,
      this.height,
      this.heightUnit,
      this.weight,
      this.weightUnit,
      this.goal,
      this.yourMeals});

  AdditionalData.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["gender"] is String) {
      gender = json["gender"];
    }
    if (json["date_of_birth"] is String) {
      dateOfBirth = json["date_of_birth"];
    }
    if (json["height"] is int) {
      height = json["height"];
    }
    if (json["height_unit"] is String) {
      heightUnit = json["height_unit"];
    }
    if (json["weight"] is int) {
      weight = json["weight"];
    }
    if (json["weight_unit"] is String) {
      weightUnit = json["weight_unit"];
    }
    if (json["goal"] is String) {
      goal = json["goal"];
    }
    if (json["your_meals"] is String) {
      yourMeals = json["your_meals"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["gender"] = gender;
    data["date_of_birth"] = dateOfBirth;
    data["height"] = height;
    data["height_unit"] = heightUnit;
    data["weight"] = weight;
    data["weight_unit"] = weightUnit;
    data["goal"] = goal;
    data["your_meals"] = yourMeals;
    return data;
  }
}
