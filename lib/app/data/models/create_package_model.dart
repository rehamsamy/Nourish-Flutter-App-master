class CreatePackageModel {
  Data? data;

  CreatePackageModel({this.data});

  CreatePackageModel.fromJson(Map<String, dynamic> json) {
    if (json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
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
  ResponseData? responseData;
  List<Packages>? packages;

  Data({this.responseData, this.packages});

  Data.fromJson(Map<String, dynamic> json) {
    if (json["response_data"] is Map) {
      responseData = json["response_data"] == null
          ? null
          : ResponseData.fromJson(json["response_data"]);
    }
    if (json["packages"] is List) {
      packages = json["packages"] == null
          ? null
          : (json["packages"] as List)
              .map((e) => Packages.fromJson(e))
              .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (responseData != null) {
      data["response_data"] = responseData?.toJson();
    }
    if (packages != null) {
      data["packages"] = packages?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Packages {
  int? id;
  String? image;
  int? tax;
  int? priceWithTax;
  int? daysNumberOfWeek;
  int? special;
  dynamic? specialFor;
  double? totalCarbs;
  double? totalFats;
  double? totalProteins;
  String? name;
  List<Descriptions>? descriptions;
  List<Breakfasts>? breakfasts;
  List<Lunches>? lunches;
  List<Dinners>? dinners;
  List<dynamic>? snacks;

  Packages(
      {this.id,
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
      this.dinners,
      this.snacks});

  Packages.fromJson(Map<String, dynamic> json) {
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
    if (json["special"] is int) {
      special = json["special"];
    }
    specialFor = json["special_for"];
    if (json["total_carbs"] is double) {
      totalCarbs = json["total_carbs"];
    }
    if (json["total_fats"] is double) {
      totalFats = json["total_fats"];
    }
    if (json["total_proteins"] is double) {
      totalProteins = json["total_proteins"];
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
    if (json["breakfasts"] is List) {
      breakfasts = json["breakfasts"] == null
          ? null
          : (json["breakfasts"] as List)
              .map((e) => Breakfasts.fromJson(e))
              .toList();
    }
    if (json["lunches"] is List) {
      lunches = json["lunches"] == null
          ? null
          : (json["lunches"] as List).map((e) => Lunches.fromJson(e)).toList();
    }
    if (json["dinners"] is List) {
      dinners = json["dinners"] == null
          ? null
          : (json["dinners"] as List).map((e) => Dinners.fromJson(e)).toList();
    }
    if (json["snacks"] is List) {
      snacks = json["snacks"] ?? [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["image"] = image;
    data["tax"] = tax;
    data["price_with_tax"] = priceWithTax;
    data["days_number_of_week"] = daysNumberOfWeek;
    data["special"] = special;
    data["special_for"] = specialFor;
    data["total_carbs"] = totalCarbs;
    data["total_fats"] = totalFats;
    data["total_proteins"] = totalProteins;
    data["name"] = name;
    if (descriptions != null) {
      data["descriptions"] = descriptions?.map((e) => e.toJson()).toList();
    }
    if (breakfasts != null) {
      data["breakfasts"] = breakfasts?.map((e) => e.toJson()).toList();
    }
    if (lunches != null) {
      data["lunches"] = lunches?.map((e) => e.toJson()).toList();
    }
    if (dinners != null) {
      data["dinners"] = dinners?.map((e) => e.toJson()).toList();
    }
    if (snacks != null) {
      data["snacks"] = snacks;
    }
    return data;
  }
}

class Dinners {
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
  Pivot2? pivot;

  Dinners(
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

  Dinners.fromJson(Map<String, dynamic> json) {
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
      pivot = json["pivot"] == null ? null : Pivot2.fromJson(json["pivot"]);
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

class Pivot2 {
  int? packageId;
  int? productId;

  Pivot2({this.packageId, this.productId});

  Pivot2.fromJson(Map<String, dynamic> json) {
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

class Lunches {
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
  Pivot1? pivot;

  Lunches(
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

  Lunches.fromJson(Map<String, dynamic> json) {
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
      pivot = json["pivot"] == null ? null : Pivot1.fromJson(json["pivot"]);
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

class Pivot1 {
  int? packageId;
  int? productId;

  Pivot1({this.packageId, this.productId});

  Pivot1.fromJson(Map<String, dynamic> json) {
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

class Breakfasts {
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

  Breakfasts(
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

  Breakfasts.fromJson(Map<String, dynamic> json) {
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
      pivot = json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]);
    }
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
    if (pivot != null) {
      data["pivot"] = pivot?.toJson();
    }
    return data;
  }
}

class Pivot {
  int? packageId;
  int? productId;

  Pivot({this.packageId, this.productId});

  Pivot.fromJson(Map<String, dynamic> json) {
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

class ResponseData {
  double? carbs;
  double? fat;
  double? protein;
  double? calories;

  ResponseData({this.carbs, this.fat, this.protein, this.calories});

  ResponseData.fromJson(Map<String, dynamic> json) {
    if (json["carbs"] is double) {
      carbs = json["carbs"];
    }
    if (json["fat"] is double) {
      fat = json["fat"];
    }
    if (json["protein"] is double) {
      protein = json["protein"];
    }
    if (json["calories"] is double) {
      calories = json["calories"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["carbs"] = carbs;
    data["fat"] = fat;
    data["protein"] = protein;
    data["calories"] = calories;
    return data;
  }
}
