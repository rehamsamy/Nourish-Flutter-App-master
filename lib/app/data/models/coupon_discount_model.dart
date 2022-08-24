class CouponDiscountModel {
  Data? data;

  CouponDiscountModel({this.data});

  CouponDiscountModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) data["data"] = this.data?.toJson();
    return data;
  }
}

class Data {
  int? totalBeforeDiscount;
  int? discount;
  int? totalAfterDiscount;

  Data({this.totalBeforeDiscount, this.discount, this.totalAfterDiscount});

  Data.fromJson(Map<String, dynamic> json) {
    totalBeforeDiscount = json["totalBeforeDiscount"];
    discount = json["Discount"];
    totalAfterDiscount = json["totalAfterDiscount"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["totalBeforeDiscount"] = totalBeforeDiscount;
    data["Discount"] = discount;

    data["totalAfterDiscount"] = totalAfterDiscount;
    return data;
  }
}
