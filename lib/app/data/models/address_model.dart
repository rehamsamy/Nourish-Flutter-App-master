class AddressModel {
  AddressModel({
      this.data,});

  AddressModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(AddressItem.fromJson(v));
      });
    }
  }
  List<AddressItem>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class AddressItem {
  AddressItem({
      this.id, 
      this.lat, 
      this.lng, 
      this.name, 
      this.addressType, 
      this.area, 
      this.building, 
      this.flat, 
      this.street, 
      this.postalCode, 
      this.additionalNumber, 
      this.deliveryInstructions,});

  AddressItem.fromJson(dynamic json) {
    id = json['id'];
    lat = json['lat'];
    lng = json['lng'];
    name = json['name'];
    addressType = json['address_type'];
    area = json['area'];
    building = json['building'];
    flat = json['flat'];
    street = json['street'];
    postalCode = json['postal_code'];
    additionalNumber = json['additional_number'];
    deliveryInstructions = json['delivery_instructions'];
  }
  int? id;
  double? lat;
  double? lng;
  String? name;
  String? addressType;
  String? area;
  String? building;
  String? flat;
  String? street;
  String? postalCode;
  String? additionalNumber;
  dynamic deliveryInstructions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['lat'] = lat;
    map['lng'] = lng;
    map['name'] = name;
    map['address_type'] = addressType;
    map['area'] = area;
    map['building'] = building;
    map['flat'] = flat;
    map['street'] = street;
    map['postal_code'] = postalCode;
    map['additional_number'] = additionalNumber;
    map['delivery_instructions'] = deliveryInstructions;
    return map;
  }

}