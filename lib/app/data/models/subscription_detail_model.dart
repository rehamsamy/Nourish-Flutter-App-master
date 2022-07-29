class SubscriptionDetailModel {
  Data? data;

  SubscriptionDetailModel({this.data});

  SubscriptionDetailModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data["data"] = this.data?.toJson();
    }
    return data;
  }
}

class Data {
  Order? order;
  Meals? meals;

  Data({this.order, this.meals});

  Data.fromJson(Map<String, dynamic> json) {
    order = json["order"] == null ? null : Order.fromJson(json["order"]);
    meals = json["meals"] == null ? null : Meals.fromJson(json["meals"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (order != null) {
      data["order"] = order?.toJson();
    }
    if (meals != null || (meals is! List<Meals>)) {
      data["meals"] = meals?.toJson();
    }
    return data;
  }
}

class Meals {
  List<MealDay>? saturday;
  List<MealDay>? sunday;
  List<MealDay>? monday;
  List<MealDay>? tuesday;
  List<MealDay>? wednesday;
  List<MealDay>? thursday;
  List<MealDay>? friday;

  Meals(
      {this.saturday,
      this.sunday,
      this.monday,
      this.tuesday,
      this.wednesday,
      this.thursday,
      this.friday});

  Meals.fromJson(Map<String, dynamic> json) {
    saturday = json["saturday"] == null
        ? null
        : (json["sunday"] as List).map((e) => MealDay.fromJson(e)).toList();
    sunday = json["sunday"] == null
        ? null
        : (json["sunday"] as List).map((e) => MealDay.fromJson(e)).toList();
    monday = json["monday"] == null
        ? null
        : (json["monday"] as List).map((e) => MealDay.fromJson(e)).toList();
    tuesday = json["tuesday"] == null
        ? null
        : (json["tuesday"] as List).map((e) => MealDay.fromJson(e)).toList();
    wednesday = json["wednesday"] == null
        ? null
        : (json["wednesday"] as List).map((e) => MealDay.fromJson(e)).toList();
    thursday = json["thursday"] == null
        ? null
        : (json["thursday"] as List).map((e) => MealDay.fromJson(e)).toList();
    friday = json["friday"] == null
        ? null
        : (json["friday"] as List).map((e) => MealDay.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (sunday != null) {
      data["sunday"] = sunday?.map((e) => e.toJson()).toList();
    }
    if (monday != null) {
      data["monday"] = monday?.map((e) => e.toJson()).toList();
    }
    if (tuesday != null) {
      data["tuesday"] = tuesday?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Tuesday {
  int? id;
  int? orderId;
  int? productId;
  String? day;
  String? mealType;
  Product2? product;

  Tuesday(
      {this.id,
      this.orderId,
      this.productId,
      this.day,
      this.mealType,
      this.product});

  Tuesday.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    orderId = json["order_id"];
    productId = json["product_id"];
    day = json["day"];
    mealType = json["meal_type"];
    product =
        json["product"] == null ? null : Product2.fromJson(json["product"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["order_id"] = orderId;
    data["product_id"] = productId;
    data["day"] = day;
    data["meal_type"] = mealType;
    if (product != null) {
      data["product"] = product?.toJson();
    }
    return data;
  }
}

class Product2 {
  int? id;
  String? image;
  int? calories;
  int? fat;
  int? protein;
  int? carb;
  int? weight;
  int? price;
  String? name;
  String? description;

  Product2(
      {this.id,
      this.image,
      this.calories,
      this.fat,
      this.protein,
      this.carb,
      this.weight,
      this.price,
      this.name,
      this.description});

  Product2.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    image = json["image"];
    calories = json["calories"];
    fat = json["fat"];
    protein = json["protein"];
    carb = json["carb"];
    weight = json["weight"];
    price = json["price"];
    name = json["name"];
    description = json["description"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["image"] = image;
    data["calories"] = calories;
    data["fat"] = fat;
    data["protein"] = protein;
    data["carb"] = carb;
    data["weight"] = weight;
    data["price"] = price;
    data["name"] = name;
    data["description"] = description;
    return data;
  }
}

class MealDay {
  int? id;
  int? orderId;
  int? productId;
  String? day;
  String? mealType;
  Product? product;

  MealDay(
      {this.id,
      this.orderId,
      this.productId,
      this.day,
      this.mealType,
      this.product});

  MealDay.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    orderId = json["order_id"];
    productId = json["product_id"];
    day = json["day"];
    mealType = json["meal_type"];
    product =
        json["product"] == null ? null : Product.fromJson(json["product"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["order_id"] = orderId;
    data["product_id"] = productId;
    data["day"] = day;
    data["meal_type"] = mealType;
    if (product != null) {
      data["product"] = product?.toJson();
    }
    return data;
  }
}



class Sunday {
  int? id;
  int? orderId;
  int? productId;
  String? day;
  String? mealType;
  Product? product;

  Sunday(
      {this.id,
      this.orderId,
      this.productId,
      this.day,
      this.mealType,
      this.product});

  Sunday.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    orderId = json["order_id"];
    productId = json["product_id"];
    day = json["day"];
    mealType = json["meal_type"];
    product =
        json["product"] == null ? null : Product.fromJson(json["product"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["order_id"] = orderId;
    data["product_id"] = productId;
    data["day"] = day;
    data["meal_type"] = mealType;
    if (product != null) {
      data["product"] = product?.toJson();
    }
    return data;
  }
}

class Product {
  int? id;
  String? image;
  int? calories;
  int? fat;
  int? protein;
  int? carb;
  int? weight;
  int? price;
  String? name;
  String? description;

  Product(
      {this.id,
      this.image,
      this.calories,
      this.fat,
      this.protein,
      this.carb,
      this.weight,
      this.price,
      this.name,
      this.description});

  Product.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    image = json["image"];
    calories = json["calories"];
    fat = json["fat"];
    protein = json["protein"];
    carb = json["carb"];
    weight = json["weight"];
    price = json["price"];
    name = json["name"];
    description = json["description"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["image"] = image;
    data["calories"] = calories;
    data["fat"] = fat;
    data["protein"] = protein;
    data["carb"] = carb;
    data["weight"] = weight;
    data["price"] = price;
    data["name"] = name;
    data["description"] = description;
    return data;
  }
}

class Order {
  int? id;
  int? branchId;
  int? addressId;
  String? deliveryType;
  int? periodId;
  String? startDate;
  String? endDate;
  int? userId;
  int? packageId;
  String? userName;
  String? packageName;
  String? branchName;
  bool? activeStatus;
  Package? package;
  Branch? branch;
  Address? address;
  Period? period;
  User? user;

  Order(
      {this.id,
      this.branchId,
      this.addressId,
      this.deliveryType,
      this.periodId,
      this.startDate,
      this.endDate,
      this.userId,
      this.packageId,
      this.userName,
      this.packageName,
      this.branchName,
      this.activeStatus,
      this.package,
      this.branch,
      this.address,
      this.period,
      this.user});

  Order.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    branchId = json["branch_id"];
    addressId = json["address_id"];
    deliveryType = json["delivery_type"];
    periodId = json["period_id"];
    startDate = json["start_date"];
    endDate = json["end_date"];
    userId = json["user_id"];
    packageId = json["package_id"];
    userName = json["user_name"];
    packageName = json["package_name"];
    branchName = json["branch_name"];
    activeStatus = json["active_status"];
    package =
        json["package"] == null ? null : Package.fromJson(json["package"]);
    branch = json["branch"] == null ? null : Branch.fromJson(json["branch"]);
    address =
        json["address"] == null ? null : Address.fromJson(json["address"]);
    period = json["period"] == null ? null : Period.fromJson(json["period"]);
    user = json["user"] == null ? null : User.fromJson(json["user"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["branch_id"] = branchId;
    data["address_id"] = addressId;
    data["delivery_type"] = deliveryType;
    data["period_id"] = periodId;
    data["start_date"] = startDate;
    data["end_date"] = endDate;
    data["user_id"] = userId;
    data["package_id"] = packageId;
    data["user_name"] = userName;
    data["package_name"] = packageName;
    data["branch_name"] = branchName;
    data["active_status"] = activeStatus;
    if (package != null) {
      data["package"] = package?.toJson();
    }
    if (branch != null) {
      data["branch"] = branch?.toJson();
    }
    if (address != null) {
      data["address"] = address?.toJson();
    }
    if (period != null) {
      data["period"] = period?.toJson();
    }
    if (user != null) {
      data["user"] = user?.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? nameEn;
  String? email;
  String? emailVerifiedAt;
  String? type;
  String? nameAr;
  String? image;
  int? status;
  String? mobile;
  dynamic? smsCode;
  dynamic? emailVerifyCode;
  int? verified;
  dynamic? locale;
  dynamic? deviceToken;
  String? name;
  String? firstName;
  String? lastName;
  AdditionalData? additionalData;

  User(
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

  User.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    nameEn = json["name_en"];
    email = json["email"];
    emailVerifiedAt = json["email_verified_at"];
    type = json["type"];
    nameAr = json["name_ar"];
    image = json["image"];
    status = json["status"];
    mobile = json["mobile"];
    smsCode = json["sms_code"];
    emailVerifyCode = json["email_verify_code"];
    verified = json["verified"];
    locale = json["locale"];
    deviceToken = json["device_token"];
    name = json["name"];
    firstName = json["first_name"];
    lastName = json["last_name"];
    additionalData = json["additional_data"] == null
        ? null
        : AdditionalData.fromJson(json["additional_data"]);
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
    id = json["id"];
    gender = json["gender"];
    dateOfBirth = json["date_of_birth"];
    height = json["height"];
    heightUnit = json["height_unit"];
    weight = json["weight"];
    weightUnit = json["weight_unit"];
    goal = json["goal"];
    yourMeals = json["your_meals"];
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

class Period {
  int? id;
  String? period;

  Period({this.id, this.period});

  Period.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    period = json["period"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["period"] = period;
    return data;
  }
}

class Address {
  int? id;
  double? lat;
  double? lng;
  String? name;
  String? addressType;
  String? area;
  String? building;
  String? flat;
  String? street;
  String? postalCode;
  String? additionalNumber;
  dynamic? deliveryInstructions;

  Address(
      {this.id,
      this.lat,
      this.lng,
      this.name,
      this.addressType,
      this.area,
      this.building,
      this.flat,
      this.street,
      this.postalCode,
      this.additionalNumber,
      this.deliveryInstructions});

  Address.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    lat = json["lat"];
    lng = json["lng"];
    name = json["name"];
    addressType = json["address_type"];
    area = json["area"];
    building = json["building"];
    flat = json["flat"];
    street = json["street"];
    postalCode = json["postal_code"];
    additionalNumber = json["additional_number"];
    deliveryInstructions = json["delivery_instructions"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["lat"] = lat;
    data["lng"] = lng;
    data["name"] = name;
    data["address_type"] = addressType;
    data["area"] = area;
    data["building"] = building;
    data["flat"] = flat;
    data["street"] = street;
    data["postal_code"] = postalCode;
    data["additional_number"] = additionalNumber;
    data["delivery_instructions"] = deliveryInstructions;
    return data;
  }
}

class Branch {
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
  List<PickupPeriods>? pickupPeriods;
  List<DeliveryPeriods>? deliveryPeriods;
  List<WorkTimes>? workTimes;

  Branch(
      {this.id,
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
      this.workTimes});

  Branch.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    googleAddress = json["google_address"];
    mobile = json["mobile"];
    coverageArea = json["coverage_area"];
    lat = json["lat"];
    lng = json["lng"];
    branchCapacity = json["branch_capacity"];
    branchPickupCapacity = json["branch_pickup_capacity"];
    deliveryFees = json["delivery_fees"];
    delivery = json["delivery"];
    pickup = json["pickup"];
    name = json["name"];
    address = json["address"];
    pickupPeriods = json["pickup_periods"] == null
        ? null
        : (json["pickup_periods"] as List)
            .map((e) => PickupPeriods.fromJson(e))
            .toList();
    deliveryPeriods = json["delivery_periods"] == null
        ? null
        : (json["delivery_periods"] as List)
            .map((e) => DeliveryPeriods.fromJson(e))
            .toList();
    workTimes = json["work_times"] == null
        ? null
        : (json["work_times"] as List)
            .map((e) => WorkTimes.fromJson(e))
            .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["google_address"] = googleAddress;
    data["mobile"] = mobile;
    data["coverage_area"] = coverageArea;
    data["lat"] = lat;
    data["lng"] = lng;
    data["branch_capacity"] = branchCapacity;
    data["branch_pickup_capacity"] = branchPickupCapacity;
    data["delivery_fees"] = deliveryFees;
    data["delivery"] = delivery;
    data["pickup"] = pickup;
    data["name"] = name;
    data["address"] = address;
    if (pickupPeriods != null) {
      data["pickup_periods"] = pickupPeriods?.map((e) => e.toJson()).toList();
    }
    if (deliveryPeriods != null) {
      data["delivery_periods"] =
          deliveryPeriods?.map((e) => e.toJson()).toList();
    }
    if (workTimes != null) {
      data["work_times"] = workTimes?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class WorkTimes {
  int? id;
  String? dataEn;
  String? dataAr;
  int? branchId;

  WorkTimes({this.id, this.dataEn, this.dataAr, this.branchId});

  WorkTimes.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    dataEn = json["data_en"];
    dataAr = json["data_ar"];
    branchId = json["branch_id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["data_en"] = dataEn;
    data["data_ar"] = dataAr;
    data["branch_id"] = branchId;
    return data;
  }
}

class DeliveryPeriods {
  int? id;
  String? period;
  Pivot1? pivot;

  DeliveryPeriods({this.id, this.period, this.pivot});

  DeliveryPeriods.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    period = json["period"];
    pivot = json["pivot"] == null ? null : Pivot1.fromJson(json["pivot"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["period"] = period;
    if (pivot != null) {
      data["pivot"] = pivot?.toJson();
    }
    return data;
  }
}

class Pivot1 {
  int? branchId;
  int? periodId;

  Pivot1({this.branchId, this.periodId});

  Pivot1.fromJson(Map<String, dynamic> json) {
    branchId = json["branch_id"];
    periodId = json["period_id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["branch_id"] = branchId;
    data["period_id"] = periodId;
    return data;
  }
}

class PickupPeriods {
  int? id;
  String? period;
  Pivot? pivot;

  PickupPeriods({this.id, this.period, this.pivot});

  PickupPeriods.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    period = json["period"];
    pivot = json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["period"] = period;
    if (pivot != null) {
      data["pivot"] = pivot?.toJson();
    }
    return data;
  }
}

class Pivot {
  int? branchId;
  int? periodId;

  Pivot({this.branchId, this.periodId});

  Pivot.fromJson(Map<String, dynamic> json) {
    branchId = json["branch_id"];
    periodId = json["period_id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["branch_id"] = branchId;
    data["period_id"] = periodId;
    return data;
  }
}

class Package {
  int? id;
  String? image;
  int? tax;
  int? priceWithTax;
  String? type;
  int? daysNumberOfWeek;
  String? name;

  Package(
      {this.id,
      this.image,
      this.tax,
      this.priceWithTax,
      this.type,
      this.daysNumberOfWeek,
      this.name});

  Package.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    image = json["image"];
    tax = json["tax"];
    priceWithTax = json["price_with_tax"];
    type = json["type"];
    daysNumberOfWeek = json["days_number_of_week"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["image"] = image;
    data["tax"] = tax;
    data["price_with_tax"] = priceWithTax;
    data["type"] = type;
    data["days_number_of_week"] = daysNumberOfWeek;
    data["name"] = name;
    return data;
  }
}
