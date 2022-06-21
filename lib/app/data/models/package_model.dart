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