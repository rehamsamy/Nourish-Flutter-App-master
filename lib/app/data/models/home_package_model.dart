class HomePackageModel {
  HomePackageModel({
      this.data,});

  HomePackageModel.fromJson(dynamic json) {
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
      this.weekly, 
      this.monthly,});

  Data.fromJson(dynamic json) {
    if (json['weekly'] != null) {
      weekly = [];
      json['weekly'].forEach((v) {
        weekly?.add(PackageItem.fromJson(v));
      });
    }
    if (json['monthly'] != null) {
      monthly = [];
      json['monthly'].forEach((v) {
        monthly?.add(PackageItem.fromJson(v));
      });
    }
  }
  List<PackageItem>? weekly;
  List<PackageItem>? monthly;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (weekly != null) {
      map['weekly'] = weekly?.map((v) => v.toJson()).toList();
    }
    if (monthly != null) {
      map['monthly'] = monthly?.map((v) => v.toJson()).toList();
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

class PackageItem {
  PackageItem({
      this.id, 
      this.image, 
      this.tax, 
      this.priceWithTax, 
      this.daysNumberOfWeek, 
      this.name, 
      this.descriptions,});

  PackageItem.fromJson(dynamic json) {
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

