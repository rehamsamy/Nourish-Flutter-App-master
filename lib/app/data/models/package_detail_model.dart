class PackageDetailModel {
  Data? data;

  PackageDetailModel({this.data});

  PackageDetailModel.fromJson(Map<String, dynamic> json) {
    if (json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data["data"] = this.data?.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? image;
  int? tax;
  int? priceWithTax;
  int? daysNumberOfWeek;
  dynamic? extraBreakfastPrice;
  dynamic? extraSnackPrice;
  int? extraLunchPrice;
  dynamic? extraDinnerPrice;
  String? daysBeforeStart;
  int? breakfast;
  int? lunch;
  int? dinner;
  int? snack;
  String? name;
  List<Descriptions>? descriptions;
  List<Branches>? branches;
  List<MealModel>? breakfasts;
  List<MealModel>? lunches;
  List<MealModel>? dinners;
  List<MealModel>? snacks;

  Data(
      {this.id,
      this.image,
      this.tax,
      this.priceWithTax,
      this.daysNumberOfWeek,
      this.extraBreakfastPrice,
      this.extraSnackPrice,
      this.extraLunchPrice,
      this.extraDinnerPrice,
      this.daysBeforeStart,
      this.breakfast,
      this.lunch,
      this.dinner,
      this.snack,
      this.name,
      this.descriptions,
      this.branches,
      this.breakfasts,
      this.lunches,
      this.dinners,
      this.snacks});

  Data.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["image"] is String) {
      image = json["image"];
    }
    if (json["tax"] is int) {
      tax = json["tax"];
    }
    if (json["price_with_tax"] is int) {
      priceWithTax = json["price_with_tax"];
    }
    if (json["days_number_of_week"] is int) {
      daysNumberOfWeek = json["days_number_of_week"];
    }
    extraBreakfastPrice = json["extra_breakfast_price"];
    extraSnackPrice = json["extra_snack_price"];
    if (json["extra_lunch_price"] is int) {
      extraLunchPrice = json["extra_lunch_price"];
    }
    extraDinnerPrice = json["extra_dinner_price"];
    if (json["days_before_start"] is String) {
      daysBeforeStart = json["days_before_start"];
    }
    if (json["breakfast"] is int) {
      breakfast = json["breakfast"];
    }
    if (json["lunch"] is int) {
      lunch = json["lunch"];
    }
    if (json["dinner"] is int) {
      dinner = json["dinner"];
    }
    if (json["snack"] is int) {
      snack = json["snack"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["descriptions"] is List) {
      descriptions = json["descriptions"] == null
          ? null
          : (json["descriptions"] as List)
              .map((e) => Descriptions.fromJson(e))
              .toList();
    }
    if (json["branches"] is List) {
      branches = json["branches"] == null
          ? null
          : (json["branches"] as List)
              .map((e) => Branches.fromJson(e))
              .toList();
    }
    if (json["breakfasts"] is List) {
      breakfasts = json["breakfasts"] == null
          ? null
          : (json["lunches"] as List)
              .map((e) => MealModel.fromJson(e))
              .toList();
    }
    if (json["lunches"] is List) {
      lunches = json["lunches"] == null
          ? null
          : (json["lunches"] as List)
              .map((e) => MealModel.fromJson(e))
              .toList();
    }
    if (json["dinners"] is List) {
      dinners = json["dinners"] == null
          ? null
          : (json["dinners"] as List)
              .map((e) => MealModel.fromJson(e))
              .toList();
    }
    if (json["snacks"] is List) {
      snacks = json["snacks"] == null
          ? null
          : (json["snacks"] as List).map((e) => MealModel.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["image"] = image;
    data["tax"] = tax;
    data["price_with_tax"] = priceWithTax;
    data["days_number_of_week"] = daysNumberOfWeek;
    data["extra_breakfast_price"] = extraBreakfastPrice;
    data["extra_snack_price"] = extraSnackPrice;
    data["extra_lunch_price"] = extraLunchPrice;
    data["extra_dinner_price"] = extraDinnerPrice;
    data["days_before_start"] = daysBeforeStart;
    data["breakfast"] = breakfast;
    data["lunch"] = lunch;
    data["dinner"] = dinner;
    data["snack"] = snack;
    data["name"] = name;
    if (descriptions != null) {
      data["descriptions"] = descriptions?.map((e) => e.toJson()).toList();
    }
    if (branches != null) {
      data["branches"] = branches?.map((e) => e.toJson()).toList();
    }
    if (breakfasts != null) {
      data["breakfasts"] = breakfasts;
    }
    if (lunches != null) {
      data["lunches"] = lunches?.map((e) => e.toJson()).toList();
    }
    if (dinners != null) {
      data["dinners"] = dinners?.map((e) => e.toJson()).toList();
    }
    if (snacks != null) {
      data["snacks"] = snacks?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Snacks {
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
  Pivot5? pivot;

  Snacks(
      {this.id,
      this.image,
      this.calories,
      this.fat,
      this.protein,
      this.carb,
      this.weight,
      this.price,
      this.name,
      this.description,
      this.pivot});

  Snacks.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["image"] is String) {
      image = json["image"];
    }
    if (json["calories"] is int) {
      calories = json["calories"];
    }
    if (json["fat"] is int) {
      fat = json["fat"];
    }
    if (json["protein"] is int) {
      protein = json["protein"];
    }
    if (json["carb"] is int) {
      carb = json["carb"];
    }
    if (json["weight"] is int) {
      weight = json["weight"];
    }
    if (json["price"] is int) {
      price = json["price"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["pivot"] is Map) {
      pivot = json["pivot"] == null ? null : Pivot5.fromJson(json["pivot"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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
    if (pivot != null) {
      data["pivot"] = pivot?.toJson();
    }
    return data;
  }
}

class Pivot5 {
  int? packageId;
  int? productId;

  Pivot5({this.packageId, this.productId});

  Pivot5.fromJson(Map<String, dynamic> json) {
    if (json["package_id"] is int) {
      packageId = json["package_id"];
    }
    if (json["product_id"] is int) {
      productId = json["product_id"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["package_id"] = packageId;
    data["product_id"] = productId;
    return data;
  }
}

class MealModel {
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
  Pivot4? pivot;

  MealModel(
      {this.id,
      this.image,
      this.calories,
      this.fat,
      this.protein,
      this.carb,
      this.weight,
      this.price,
      this.name,
      this.description,
      this.pivot});

  MealModel.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["image"] is String) {
      image = json["image"];
    }
    if (json["calories"] is int) {
      calories = json["calories"];
    }
    if (json["fat"] is int) {
      fat = json["fat"];
    }
    if (json["protein"] is int) {
      protein = json["protein"];
    }
    if (json["carb"] is int) {
      carb = json["carb"];
    }
    if (json["weight"] is int) {
      weight = json["weight"];
    }
    if (json["price"] is int) {
      price = json["price"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["pivot"] is Map) {
      pivot = json["pivot"] == null ? null : Pivot4.fromJson(json["pivot"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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
    if (pivot != null) {
      data["pivot"] = pivot?.toJson();
    }
    return data;
  }
}

class Pivot4 {
  int? packageId;
  int? productId;

  Pivot4({this.packageId, this.productId});

  Pivot4.fromJson(Map<String, dynamic> json) {
    if (json["package_id"] is int) {
      packageId = json["package_id"];
    }
    if (json["product_id"] is int) {
      productId = json["product_id"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["package_id"] = packageId;
    data["product_id"] = productId;
    return data;
  }
}

class Pivot3 {
  int? packageId;
  int? productId;

  Pivot3({this.packageId, this.productId});

  Pivot3.fromJson(Map<String, dynamic> json) {
    if (json["package_id"] is int) {
      packageId = json["package_id"];
    }
    if (json["product_id"] is int) {
      productId = json["product_id"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["package_id"] = packageId;
    data["product_id"] = productId;
    return data;
  }
}

class Branches {
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
  Pivot? pivot;
  List<PickupPeriods>? pickupPeriods;
  List<DeliveryPeriods>? deliveryPeriods;
  List<WorkTimes>? workTimes;

  Branches(
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
      this.pivot,
      this.pickupPeriods,
      this.deliveryPeriods,
      this.workTimes});

  Branches.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["google_address"] is String) {
      googleAddress = json["google_address"];
    }
    if (json["mobile"] is String) {
      mobile = json["mobile"];
    }
    if (json["coverage_area"] is int) {
      coverageArea = json["coverage_area"];
    }
    if (json["lat"] is double) {
      lat = json["lat"];
    }
    if (json["lng"] is double) {
      lng = json["lng"];
    }
    if (json["branch_capacity"] is int) {
      branchCapacity = json["branch_capacity"];
    }
    if (json["branch_pickup_capacity"] is int) {
      branchPickupCapacity = json["branch_pickup_capacity"];
    }
    if (json["delivery_fees"] is int) {
      deliveryFees = json["delivery_fees"];
    }
    if (json["delivery"] is int) {
      delivery = json["delivery"];
    }
    if (json["pickup"] is int) {
      pickup = json["pickup"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["address"] is String) {
      address = json["address"];
    }
    if (json["pivot"] is Map) {
      pivot = json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]);
    }
    if (json["pickup_periods"] is List) {
      pickupPeriods = json["pickup_periods"] == null
          ? null
          : (json["pickup_periods"] as List)
              .map((e) => PickupPeriods.fromJson(e))
              .toList();
    }
    if (json["delivery_periods"] is List) {
      deliveryPeriods = json["delivery_periods"] == null
          ? null
          : (json["delivery_periods"] as List)
              .map((e) => DeliveryPeriods.fromJson(e))
              .toList();
    }
    if (json["work_times"] is List) {
      workTimes = json["work_times"] == null
          ? null
          : (json["work_times"] as List)
              .map((e) => WorkTimes.fromJson(e))
              .toList();
    }
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
    if (pivot != null) {
      data["pivot"] = pivot?.toJson();
    }
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
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["data_en"] is String) {
      dataEn = json["data_en"];
    }
    if (json["data_ar"] is String) {
      dataAr = json["data_ar"];
    }
    if (json["branch_id"] is int) {
      branchId = json["branch_id"];
    }
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
  Pivot2? pivot;

  DeliveryPeriods({this.id, this.period, this.pivot});

  DeliveryPeriods.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["period"] is String) {
      period = json["period"];
    }
    if (json["pivot"] is Map) {
      pivot = json["pivot"] == null ? null : Pivot2.fromJson(json["pivot"]);
    }
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

class Pivot2 {
  int? branchId;
  int? periodId;

  Pivot2({this.branchId, this.periodId});

  Pivot2.fromJson(Map<String, dynamic> json) {
    if (json["branch_id"] is int) {
      branchId = json["branch_id"];
    }
    if (json["period_id"] is int) {
      periodId = json["period_id"];
    }
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
  Pivot1? pivot;

  PickupPeriods({this.id, this.period, this.pivot});

  PickupPeriods.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["period"] is String) {
      period = json["period"];
    }
    if (json["pivot"] is Map) {
      pivot = json["pivot"] == null ? null : Pivot1.fromJson(json["pivot"]);
    }
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
    if (json["branch_id"] is int) {
      branchId = json["branch_id"];
    }
    if (json["period_id"] is int) {
      periodId = json["period_id"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["branch_id"] = branchId;
    data["period_id"] = periodId;
    return data;
  }
}

class Pivot {
  int? packageId;
  int? branchId;

  Pivot({this.packageId, this.branchId});

  Pivot.fromJson(Map<String, dynamic> json) {
    if (json["package_id"] is int) {
      packageId = json["package_id"];
    }
    if (json["branch_id"] is int) {
      branchId = json["branch_id"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["package_id"] = packageId;
    data["branch_id"] = branchId;
    return data;
  }
}

class Descriptions {
  int? id;
  String? desc;

  Descriptions({this.id, this.desc});

  Descriptions.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["desc"] is String) {
      desc = json["desc"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["desc"] = desc;
    return data;
  }
}
