class PaymentModel {
  PaymentModel({
      this.data,});

  PaymentModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(PaymentItem.fromJson(v));
      });
    }
  }
  List<PaymentItem>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class PaymentItem {
  PaymentItem({
      this.id, 
      this.nameEn, 
      this.nameAr, 
      this.logo, 
      this.status, 
      this.name,});

  PaymentItem.fromJson(dynamic json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    logo = json['logo'];
    status = json['status'];
    name = json['name'];
  }
  int? id;
  String? nameEn;
  String? nameAr;
  String? logo;
  int? status;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name_en'] = nameEn;
    map['name_ar'] = nameAr;
    map['logo'] = logo;
    map['status'] = status;
    map['name'] = name;
    return map;
  }

}