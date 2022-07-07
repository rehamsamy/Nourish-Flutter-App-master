class BranchModel {
  BranchModel({
      this.data,});

  BranchModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(BranchItem.fromJson(v));
      });
    }
  }
  List<BranchItem>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class BranchItem {
  BranchItem({
      this.id, 
      this.googleAddress, 
      this.lat, 
      this.lng, 
      this.coverageArea, 
      this.pickup, 
      this.delivery, 
      this.mobile, 
      this.name, 
      this.address, 
      this.pickupPeriods, 
      this.deliveryPeriods, 
      this.workTimes,});

  BranchItem.fromJson(dynamic json) {
    id = json['id'];
    googleAddress = json['google_address'];
    lat = json['lat'];
    lng = json['lng'];
    coverageArea = json['coverage_area'];
    pickup = json['pickup'];
    delivery = json['delivery'];
    mobile = json['mobile'];
    name = json['name'];
    address = json['address'];
    if (json['pickup_periods'] != null) {
      pickupPeriods = [];
      json['pickup_periods'].forEach((v) {
        pickupPeriods?.add(Pickup_periods.fromJson(v));
      });
    }
    if (json['delivery_periods'] != null) {
      deliveryPeriods = [];
      json['delivery_periods'].forEach((v) {
        deliveryPeriods?.add(Delivery_periods.fromJson(v));
      });
    }
    if (json['work_times'] != null) {
      workTimes = [];
      json['work_times'].forEach((v) {
        workTimes?.add(Work_times.fromJson(v));
      });
    }
  }
  int? id;
  String? googleAddress;
  double? lat;
  double? lng;
  int? coverageArea;
  int? pickup;
  int? delivery;
  String? mobile;
  String? name;
  String? address;
  List<Pickup_periods>? pickupPeriods;
  List<Delivery_periods>? deliveryPeriods;
  List<Work_times>? workTimes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['google_address'] = googleAddress;
    map['lat'] = lat;
    map['lng'] = lng;
    map['coverage_area'] = coverageArea;
    map['pickup'] = pickup;
    map['delivery'] = delivery;
    map['mobile'] = mobile;
    map['name'] = name;
    map['address'] = address;
    if (pickupPeriods != null) {
      map['pickup_periods'] = pickupPeriods?.map((v) => v.toJson()).toList();
    }
    if (deliveryPeriods != null) {
      map['delivery_periods'] = deliveryPeriods?.map((v) => v.toJson()).toList();
    }
    if (workTimes != null) {
      map['work_times'] = workTimes?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Work_times {
  Work_times({
      this.id, 
      this.dataEn, 
      this.dataAr, 
      this.branchId,});

  Work_times.fromJson(dynamic json) {
    id = json['id'];
    dataEn = json['data_en'];
    dataAr = json['data_ar'];
    branchId = json['branch_id'];
  }
  int? id;
  String? dataEn;
  String? dataAr;
  int? branchId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['data_en'] = dataEn;
    map['data_ar'] = dataAr;
    map['branch_id'] = branchId;
    return map;
  }

}

class Delivery_periods {
  Delivery_periods({
      this.id, 
      this.period, 
      this.pivot,});

  Delivery_periods.fromJson(dynamic json) {
    id = json['id'];
    period = json['period'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }
  int? id;
  String? period;
  Pivot? pivot;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['period'] = period;
    if (pivot != null) {
      map['pivot'] = pivot?.toJson();
    }
    return map;
  }

}

class Pivot {
  Pivot({
      this.branchId, 
      this.periodId,});

  Pivot.fromJson(dynamic json) {
    branchId = json['branch_id'];
    periodId = json['period_id'];
  }
  int? branchId;
  int? periodId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['branch_id'] = branchId;
    map['period_id'] = periodId;
    return map;
  }

}

class Pickup_periods {
  Pickup_periods({
      this.id, 
      this.period, 
      this.pivot,});

  Pickup_periods.fromJson(dynamic json) {
    id = json['id'];
    period = json['period'];
    pivot = json['pivot'] != null ? Pivot1.fromJson(json['pivot']) : null;
  }
  int? id;
  String? period;
  Pivot1? pivot;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['period'] = period;
    if (pivot != null) {
      map['pivot'] = pivot?.toJson();
    }
    return map;
  }

}

class Pivot1 {
  Pivot1({
      this.branchId, 
      this.periodId,});

  Pivot1.fromJson(dynamic json) {
    branchId = json['branch_id'];
    periodId = json['period_id'];
  }
  int? branchId;
  int? periodId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['branch_id'] = branchId;
    map['period_id'] = periodId;
    return map;
  }

}