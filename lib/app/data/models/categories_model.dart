class CategoriesModel {
  CategoriesModel({
      this.categoryData,});

  CategoriesModel.fromJson(dynamic json) {
    categoryData = json['data'] != null ? CategoryData.fromJson(json['data']) : null;
  }
  CategoryData? categoryData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (categoryData != null) {
      map['data'] = categoryData?.toJson();
    }
    return map;
  }

}

class CategoryData {
  CategoryData({
      this.categoriesList,
      this.paginate,});

  CategoryData.fromJson(dynamic json) {
    if (json['data'] != null) {
      categoriesList = [];
      json['data'].forEach((v) {
        categoriesList?.add(CategoryItem.fromJson(v));
      });
    }
    paginate = json['paginate'] != null ? Paginate.fromJson(json['paginate']) : null;
  }
  List<CategoryItem>? categoriesList;
  Paginate? paginate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (categoriesList != null) {
      map['data'] = categoriesList?.map((v) => v.toJson()).toList();
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

class CategoryItem {
  CategoryItem({
      this.id, 
      this.image, 
      this.name,});

  CategoryItem.fromJson(dynamic json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
  }
  int? id;
  String? image;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['image'] = image;
    map['name'] = name;
    return map;
  }

}