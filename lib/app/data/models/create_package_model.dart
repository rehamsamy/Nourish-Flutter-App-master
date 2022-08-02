class CreatePackageModel {
  CreatePackageModel({
      this.data,});

  CreatePackageModel.fromJson(dynamic json) {
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
      this.responseData, 
      this.packages,});

  Data.fromJson(dynamic json) {
    responseData = json['response_data'] != null ? ResponseData.fromJson(json['responseData']) : null;
    // if (json['packages'] != null) {
    //   packages = [];
    //   json['packages'].forEach((v) {
    //     packages?.add(Packages.fromJson(v));
    //   });
    // }
  }
  ResponseData? responseData;
  List<Packages>? packages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (responseData != null) {
      map['response_data'] = responseData?.toJson();
    }
    if (packages != null) {
      map['packages'] = packages?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Packages {
  Packages({
      this.id,
      this.image,
      this.tax,
      this.priceWithTax,
      this.daysNumberOfWeek,
      this.special,
      this.specialFor,
      this.totalCarbs,
      this.totalFats,
      this.totalProteins,
      this.name,
      this.descriptions,
      this.breakfasts,
      this.lunches,
      this.dinners,});

  Packages.fromJson(dynamic json) {
    id = json['id'];
    image = json['image'];
    tax = json['tax'];
    priceWithTax = json['price_with_tax'];
    daysNumberOfWeek = json['days_number_of_week'];
    special = json['special'];
    specialFor = json['special_for'];
    totalCarbs = json['total_carbs'];
    totalFats = json['total_fats'];
    totalProteins = json['total_proteins'];
    name = json['name'];
    if (json['descriptions'] != null) {
      descriptions = [];
      json['descriptions'].forEach((v) {
        descriptions?.add(Descriptions.fromJson(v));
      });
    }
    if (json['breakfasts'] != null) {
      breakfasts = [];
      json['breakfasts'].forEach((v) {
        breakfasts?.add(Breakfasts.fromJson(v));
      });
    }
    if (json['lunches'] != null) {
      lunches = [];
      json['lunches'].forEach((v) {
        lunches?.add(Breakfasts.fromJson(v));
      });
    }
    if (json['dinners'] != null) {
      dinners = [];
      json['dinners'].forEach((v) {
        dinners?.add(Breakfasts.fromJson(v));
      });
    }
  }
  int? id;
  String? image;
  int? tax;
  int? priceWithTax;
  int? daysNumberOfWeek;
  int? special;
  dynamic specialFor;
  double? totalCarbs;
  double? totalFats;
  double? totalProteins;
  String? name;
  List<Descriptions>? descriptions;
  List<Breakfasts>? breakfasts;
  List<dynamic>? lunches;
  List<dynamic>? dinners;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['image'] = image;
    map['tax'] = tax;
    map['price_with_tax'] = priceWithTax;
    map['days_number_of_week'] = daysNumberOfWeek;
    map['special'] = special;
    map['special_for'] = specialFor;
    map['total_carbs'] = totalCarbs;
    map['total_fats'] = totalFats;
    map['total_proteins'] = totalProteins;
    map['name'] = name;
    if (descriptions != null) {
      map['descriptions'] = descriptions?.map((v) => v.toJson()).toList();
    }
    if (breakfasts != null) {
      map['breakfasts'] = breakfasts?.map((v) => v.toJson()).toList();
    }
    if (lunches != null) {
      map['lunches'] = lunches?.map((v) => v.toJson()).toList();
    }
    if (dinners != null) {
      map['dinners'] = dinners?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Breakfasts {
  Breakfasts({
      this.id,
      this.image,
      this.calories,
      this.fat,
      this.protein,
      this.carb,
      this.weight,
      this.price,
      this.name,
      this.description,
      this.pivot,});

  Breakfasts.fromJson(dynamic json) {
    id = json['id'];
    image = json['image'];
    calories = json['calories'];
    fat = json['fat'];
    protein = json['protein'];
    carb = json['carb'];
    weight = json['weight'];
    price = json['price'];
    name = json['name'];
    description = json['description'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }
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
  Pivot? pivot;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['image'] = image;
    map['calories'] = calories;
    map['fat'] = fat;
    map['protein'] = protein;
    map['carb'] = carb;
    map['weight'] = weight;
    map['price'] = price;
    map['name'] = name;
    map['description'] = description;
    if (pivot != null) {
      map['pivot'] = pivot?.toJson();
    }
    return map;
  }

}

class Pivot {
  Pivot({
      this.packageId,
      this.productId,});

  Pivot.fromJson(dynamic json) {
    packageId = json['package_id'];
    productId = json['product_id'];
  }
  int? packageId;
  int? productId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['package_id'] = packageId;
    map['product_id'] = productId;
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

class ResponseData {
  ResponseData({
      this.carbs, 
      this.fat, 
      this.protein, 
      this.calories,});

  ResponseData.fromJson(dynamic json) {
    carbs = json['carbs'];
    fat = json['fat'];
    protein = json['protein'];
    calories = json['calories'];
  }
  double? carbs;
  double? fat;
  double? protein;
  double? calories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['carbs'] = carbs;
    map['fat'] = fat;
    map['protein'] = protein;
    map['calories'] = calories;
    return map;
  }

}