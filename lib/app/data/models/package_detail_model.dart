import 'package:nourish_sa/app/data/models/branch_model.dart';

class PackageDetailModel {
  PackageDetailModel({
      this.data,});

  PackageDetailModel.fromJson(dynamic json) {
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
      this.id, 
      this.image, 
      this.tax, 
      this.priceWithTax, 
      this.daysNumberOfWeek, 
      this.extraBreakfastPrice, 
      this.extraLunchPrice, 
      this.extraDinnerPrice, 
      this.daysBeforeStart, 
      this.name, 
      this.descriptions, 
      this.branches, 
      this.breakfasts, 
      this.lunches, 
      this.dinners,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    image = json['image'];
    tax = json['tax'];
    priceWithTax = json['price_with_tax'];
    daysNumberOfWeek = json['days_number_of_week'];
    extraBreakfastPrice = json['extra_breakfast_price'];
    extraLunchPrice = json['extra_lunch_price'];
    extraDinnerPrice = json['extra_dinner_price'];
    daysBeforeStart = json['days_before_start'];
    name = json['name'];
    if (json['descriptions'] != null) {
      descriptions = [];
      json['descriptions'].forEach((v) {
        descriptions?.add(Descriptions.fromJson(v));
      });
    }
    if (json['branches'] != null) {
      branches = [];
      json['branches'].forEach((v) {
        branches?.add(BranchItem.fromJson(v));
      });
    }
    if (json['breakfasts'] != null) {
      breakfasts = [];
      json['breakfasts'].forEach((v) {
        breakfasts?.add(MealsModel.fromJson(v));
      });
    }
    if (json['lunches'] != null) {
      lunches = [];
      json['lunches'].forEach((v) {
        lunches?.add(MealsModel.fromJson(v));
      });
    }
    if (json['dinners'] != null) {
      dinners = [];
      json['dinners'].forEach((v) {
        dinners?.add(MealsModel.fromJson(v));
      });
    }
  }
  int? id;
  String? image;
  int? tax;
  int? priceWithTax;
  int? daysNumberOfWeek;
  int? extraBreakfastPrice;
  int? extraLunchPrice;
  int? extraDinnerPrice;
  String? daysBeforeStart;
  String? name;
  List<Descriptions>? descriptions;
  List<BranchItem>? branches;
  List<MealsModel>? breakfasts;
  List<MealsModel>? lunches;
  List<MealsModel>? dinners;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['image'] = image;
    map['tax'] = tax;
    map['price_with_tax'] = priceWithTax;
    map['days_number_of_week'] = daysNumberOfWeek;
    map['extra_breakfast_price'] = extraBreakfastPrice;
    map['extra_lunch_price'] = extraLunchPrice;
    map['extra_dinner_price'] = extraDinnerPrice;
    map['days_before_start'] = daysBeforeStart;
    map['name'] = name;
    if (descriptions != null) {
      map['descriptions'] = descriptions?.map((v) => v.toJson()).toList();
    }
    if (branches != null) {
      map['branches'] = branches?.map((v) => v.toJson()).toList();
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

class MealsModel {
  MealsModel({
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

  MealsModel.fromJson(dynamic json) {
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