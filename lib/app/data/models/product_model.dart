class ProductModel {
  ProductModel({
      this.data,});

  ProductModel.fromJson(dynamic json) {
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
      this.productdata,
      this.paginate,});

  Data.fromJson(dynamic json) {
    if (json['data'] != null) {
      productdata = [];
      json['data'].forEach((v) {
        productdata?.add(ProductItem.fromJson(v));
      });
    }
    paginate = json['paginate'] != null ? Paginate.fromJson(json['paginate']) : null;
  }
  List<ProductItem>? productdata;
  Paginate? paginate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (productdata != null) {
      map['data'] = productdata?.map((v) => v.toJson()).toList();
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

class ProductItem {
  ProductItem({
      this.id, 
      this.image, 
      this.calories, 
      this.carb, 
      this.fat, 
      this.protein, 
      this.name, 
      this.description,});

  ProductItem.fromJson(dynamic json) {
    id = json['id'];
    image = json['image'];
    calories = json['calories'];
    carb = json['carb'];
    fat = json['fat'];
    protein = json['protein'];
    name = json['name'];
    description = json['description'];
  }
  int? id;
  String? image;
  int? calories;
  int? carb;
  int? fat;
  int? protein;
  String? name;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['image'] = image;
    map['calories'] = calories;
    map['carb'] = carb;
    map['fat'] = fat;
    map['protein'] = protein;
    map['name'] = name;
    map['description'] = description;
    return map;
  }

}