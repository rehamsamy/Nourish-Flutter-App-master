class SubscriptionModel {
  SubscriptionModel({
      this.data,});

  SubscriptionModel.fromJson(dynamic json) {
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
      this.subscriptiondata, 
      this.paginate,});

  Data.fromJson(dynamic json) {
    if (json['data'] != null) {
      subscriptiondata = [];
      json['data'].forEach((v) {
        subscriptiondata?.add(Subscriptiondata.fromJson(v));
      });
    }
    paginate = json['paginate'] != null ? Paginate.fromJson(json['paginate']) : null;
  }
  List<Subscriptiondata>? subscriptiondata;
  Paginate? paginate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (subscriptiondata != null) {
      map['subscriptiondata'] = subscriptiondata?.map((v) => v.toJson()).toList();
    }
    if (paginate != null) {
      map['paginate'] = paginate?.toJson();
    }
    return map;
  }

}

class Paginate {
  Paginate({
      this.currentPage, 
      this.lastPage, 
      this.perPage, 
      this.total,});

  Paginate.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    lastPage = json['lastPage'];
    perPage = json['perPage'];
    total = json['total'];
  }
  int? currentPage;
  int? lastPage;
  String? perPage;
  int? total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = currentPage;
    map['lastPage'] = lastPage;
    map['perPage'] = perPage;
    map['total'] = total;
    return map;
  }

}

class Subscriptiondata {
  Subscriptiondata({
      this.id, 
      this.packageId, 
      this.userId, 
      this.branchId, 
      this.userName, 
      this.packageName, 
      this.branchName, 
      this.package, 
      this.user, 
      this.branch,});

  Subscriptiondata.fromJson(dynamic json) {
    id = json['id'];
    packageId = json['package_id'];
    userId = json['user_id'];
    branchId = json['branch_id'];
    userName = json['user_name'];
    packageName = json['package_name'];
    branchName = json['branch_name'];
    package = json['package'] != null ? Package.fromJson(json['package']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    branch = json['branch'] != null ? Branch.fromJson(json['branch']) : null;
  }
  int? id;
  int? packageId;
  int? userId;
  int? branchId;
  String? userName;
  String? packageName;
  String? branchName;
  Package? package;
  User? user;
  Branch? branch;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['package_id'] = packageId;
    map['user_id'] = userId;
    map['branch_id'] = branchId;
    map['user_name'] = userName;
    map['package_name'] = packageName;
    map['branch_name'] = branchName;
    if (package != null) {
      map['package'] = package?.toJson();
    }
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (branch != null) {
      map['branch'] = branch?.toJson();
    }
    return map;
  }

}

class Branch {
  Branch({
      this.id, 
      this.googleAddress, 
      this.mobile, 
      this.coverageArea, 
      this.lat, 
      this.lng, 
      this.branchCapacity, 
      this.branchPickupCapacity, 
      this.deliveryFees, 
      this.delivery, 
      this.pickup, 
      this.name, 
      this.address, 
      this.pickupPeriods, 
      this.deliveryPeriods, 
      this.workTimes,});

  Branch.fromJson(dynamic json) {
    id = json['id'];
    googleAddress = json['google_address'];
    mobile = json['mobile'];
    coverageArea = json['coverage_area'];
    lat = json['lat'];
    lng = json['lng'];
    branchCapacity = json['branch_capacity'];
    branchPickupCapacity = json['branch_pickup_capacity'];
    deliveryFees = json['delivery_fees'];
    delivery = json['delivery'];
    pickup = json['pickup'];
    name = json['name'];
    address = json['address'];
    if (json['pickup_periods'] != null) {
      pickupPeriods = [];
      json['pickup_periods'].forEach((v) {
        pickupPeriods?.add(Pickup_periods.fromJson(v));
      });
    }
    if (json['delivery_periods'] != null) {
      deliveryPeriods = [];
      json['delivery_periods'].forEach((v) {
        deliveryPeriods?.add(Delivery_periods.fromJson(v));
      });
    }
    if (json['work_times'] != null) {
      workTimes = [];
      json['work_times'].forEach((v) {
        workTimes?.add(Work_times.fromJson(v));
      });
    }
  }
  int? id;
  String? googleAddress;
  String? mobile;
  int? coverageArea;
  double? lat;
  double? lng;
  int? branchCapacity;
  int? branchPickupCapacity;
  int? deliveryFees;
  int? delivery;
  int? pickup;
  String? name;
  String? address;
  List<Pickup_periods>? pickupPeriods;
  List<Delivery_periods>? deliveryPeriods;
  List<Work_times>? workTimes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['google_address'] = googleAddress;
    map['mobile'] = mobile;
    map['coverage_area'] = coverageArea;
    map['lat'] = lat;
    map['lng'] = lng;
    map['branch_capacity'] = branchCapacity;
    map['branch_pickup_capacity'] = branchPickupCapacity;
    map['delivery_fees'] = deliveryFees;
    map['delivery'] = delivery;
    map['pickup'] = pickup;
    map['name'] = name;
    map['address'] = address;
    if (pickupPeriods != null) {
      map['pickup_periods'] = pickupPeriods?.map((v) => v.toJson()).toList();
    }
    if (deliveryPeriods != null) {
      map['delivery_periods'] = deliveryPeriods?.map((v) => v.toJson()).toList();
    }
    if (workTimes != null) {
      map['work_times'] = workTimes?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Work_times {
  Work_times({
      this.id, 
      this.data, 
      this.branchId,});

  Work_times.fromJson(dynamic json) {
    id = json['id'];
    data = json['data'];
    branchId = json['branch_id'];
  }
  int? id;
  String? data;
  int? branchId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['data'] = data;
    map['branch_id'] = branchId;
    return map;
  }

}

class Delivery_periods {
  Delivery_periods({
      this.id, 
      this.period, 
      this.pivot,});

  Delivery_periods.fromJson(dynamic json) {
    id = json['id'];
    period = json['period'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }
  int? id;
  String? period;
  Pivot? pivot;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['period'] = period;
    if (pivot != null) {
      map['pivot'] = pivot?.toJson();
    }
    return map;
  }

}

class Pivot {
  Pivot({
      this.branchId, 
      this.periodId,});

  Pivot.fromJson(dynamic json) {
    branchId = json['branch_id'];
    periodId = json['period_id'];
  }
  int? branchId;
  int? periodId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['branch_id'] = branchId;
    map['period_id'] = periodId;
    return map;
  }

}

class Pickup_periods {
  Pickup_periods({
      this.id, 
      this.period, 
      this.pivot1,});

  Pickup_periods.fromJson(dynamic json) {
    id = json['id'];
    period = json['period'];
    pivot1 = json['pivot'] != null ? Pivot1.fromJson(json['pivot1']) : null;
  }
  int? id;
  String? period;
  Pivot1? pivot1;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['period'] = period;
    if (pivot1 != null) {
      map['pivot'] = pivot1?.toJson();
    }
    return map;
  }

}

class Pivot1 {
  Pivot1({
      this.branchId, 
      this.periodId,});

  Pivot1.fromJson(dynamic json) {
    branchId = json['branch_id'];
    periodId = json['period_id'];
  }
  int? branchId;
  int? periodId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['branch_id'] = branchId;
    map['period_id'] = periodId;
    return map;
  }

}

class User {
  User({
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

  User.fromJson(dynamic json) {
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

class Package {
  Package({
      this.id, 
      this.image, 
      this.tax, 
      this.priceWithTax, 
      this.daysNumberOfWeek, 
      this.name, 
      this.descriptions,});

  Package.fromJson(dynamic json) {
    id = json['id'];
    image = json['image'];
    tax = json['tax'];
    priceWithTax = json['price_with_tax'];
    daysNumberOfWeek = json['days_number_of_week'];
    name = json['name'];
    if (json['descriptions'] != null) {
      descriptions = [];
      json['descriptions'].forEach((v) {
        descriptions?.add(Descriptions.fromJson(v));
      });
    }
  }
  int? id;
  String? image;
  int? tax;
  int? priceWithTax;
  int? daysNumberOfWeek;
  String? name;
  List<Descriptions>? descriptions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['image'] = image;
    map['tax'] = tax;
    map['price_with_tax'] = priceWithTax;
    map['days_number_of_week'] = daysNumberOfWeek;
    map['name'] = name;
    if (descriptions != null) {
      map['descriptions'] = descriptions?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Descriptions {
  Descriptions({
      this.id, 
      this.desc,});

  Descriptions.fromJson(dynamic json) {
    id = json['id'];
    desc = json['desc'];
  }
  int? id;
  String? desc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['desc'] = desc;
    return map;
  }

}