class AddOrderModel {
  AddOrderModel({
      this.data,});

  AddOrderModel.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message=(json['message'] != null )  as String?;
  }
  Data? data;
  String ?message;

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
      this.msg, 
      this.orderId,});

  Data.fromJson(dynamic json) {
    msg = json['msg'];
    orderId = json['orderId'];
  }
  String? msg;
  int? orderId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['msg'] = msg;
    map['orderId'] = orderId;
    return map;
  }

}