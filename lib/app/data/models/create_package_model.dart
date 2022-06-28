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
    if (json['packages'] != null) {
      packages = [];
      json['packages'].forEach((v) {
      //  packages?.add(dynamic.fromJson(v));
      });
    }
  }
  ResponseData? responseData;
  List<dynamic>? packages;

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

class ResponseData {
  ResponseData({
      this.carbs, 
      this.fat, 
      this.protein,});

  ResponseData.fromJson(dynamic json) {
    carbs = json['carbs'];
    fat = json['fat'];
    protein = json['protein'];
  }
  double? carbs;
  double? fat;
  double? protein;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['carbs'] = carbs;
    map['fat'] = fat;
    map['protein'] = protein;
    return map;
  }

}