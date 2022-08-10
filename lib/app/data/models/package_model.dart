import 'package:nourish_sa/app/data/models/home_package_model.dart';

class PackageModel {
  PackageModel({
      this.data,});

  PackageModel.fromJson(dynamic json) {
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
      this.packagedata, 
      this.paginate,});

  Data.fromJson(dynamic json) {
    if (json['data'] != null) {
      packagedata = [];
      json['data'].forEach((v) {
        packagedata?.add(PackageItem.fromJson(v));
      });
    }
    paginate = json['paginate'] != null ? Paginate.fromJson(json['paginate']) : null;
  }
  List<PackageItem>? packagedata;
  Paginate? paginate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (packagedata != null) {
      map['data'] = packagedata?.map((v) => v.toJson()).toList();
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


