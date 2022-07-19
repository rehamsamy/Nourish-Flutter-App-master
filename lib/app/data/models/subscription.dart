// class SubscriptionDetailModel {
//   SubscriptionDetailModel({
//     this.data,});
//
//   SubscriptionDetailModel.fromJson(dynamic json) {
//     data = json['data'] != null ? Data.fromJson(json['data']) : null;
//   }
//   Data? data;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     if (data != null) {
//       map['data'] = data?.toJson();
//     }
//     return map;
//   }
//
// }
//
// class Data {
//   Data({
//     this.order,
//     this.meals,});
//
//   Data.fromJson(dynamic json) {
//     order = json['order'] != null ? Order.fromJson(json['order']) : null;
//     meals = json['meals'] != null ? Meals.fromJson(json['meals']) : null;
//   }
//   Order? order;
//   Meals? meals;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     if (order != null) {
//       map['order'] = order?.toJson();
//     }
//     if (meals != null) {
//       map['meals'] = meals?.toJson();
//     }
//     return map;
//   }
//
// }
//
// class Meals {
//   Meals({
//     this.saturday,});
//
//   Meals.fromJson(dynamic json) {
//     if (json['saturday'] != null) {
//       saturday = [];
//       json['saturday'].forEach((v) {
//         saturday?.add(Saturday.fromJson(v));
//       });
//     }
//   }
//   List<Saturday>? saturday;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     if (saturday != null) {
//       map['saturday'] = saturday?.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
//
// }
//
// class Saturday {
//   Saturday({
//     this.id,
//     this.orderId,
//     this.productId,
//     this.day,
//     this.mealType,
//     this.product,});
//
//   Saturday.fromJson(dynamic json) {
//     id = json['id'];
//     orderId = json['order_id'];
//     productId = json['product_id'];
//     day = json['day'];
//     mealType = json['meal_type'];
//     product = json['product'] != null ? Product.fromJson(json['product']) : null;
//   }
//   int? id;
//   int? orderId;
//   int? productId;
//   String? day;
//   String? mealType;
//   Product? product;
//
//
//
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['order_id'] = orderId;
//     map['product_id'] = productId;
//     map['day'] = day;
//     map['meal_type'] = mealType;
//     if (product != null) {
//       map['product'] = product?.toJson();
//     }
//     return map;
//   }
//
// }
//
// class Product {
//   Product({
//     this.id,
//     this.image,
//     this.calories,
//     this.fat,
//     this.protein,
//     this.carb,
//     this.weight,
//     this.price,
//     this.name,
//     this.description,});
//
//   Product.fromJson(dynamic json) {
//     id = json['id'];
//     image = json['image'];
//     calories = json['calories'];
//     fat = json['fat'];
//     protein = json['protein'];
//     carb = json['carb'];
//     weight = json['weight'];
//     price = json['price'];
//     name = json['name'];
//     description = json['description'];
//   }
//   int? id;
//   String? image;
//   int? calories;
//   int? fat;
//   int? protein;
//   int? carb;
//   int? weight;
//   int? price;
//   String? name;
//   String? description;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['image'] = image;
//     map['calories'] = calories;
//     map['fat'] = fat;
//     map['protein'] = protein;
//     map['carb'] = carb;
//     map['weight'] = weight;
//     map['price'] = price;
//     map['name'] = name;
//     map['description'] = description;
//     return map;
//   }
//
// }
//
// class Order {
//   Order({
//     this.id,
//     this.branchId,
//     this.addressId,
//     this.deliveryType,
//     this.periodId,
//     this.startDate,
//     this.endDate,
//     this.userId,
//     this.packageId,
//     this.userName,
//     this.packageName,
//     this.branchName,
//     this.activeStatus,
//     this.package,
//     this.branch,
//     this.address,
//     this.period,
//     this.user,});
//
//   Order.fromJson(dynamic json) {
//     id = json['id'];
//     branchId = json['branch_id'];
//     addressId = json['address_id'];
//     deliveryType = json['delivery_type'];
//     periodId = json['period_id'];
//     startDate = json['start_date'];
//     endDate = json['end_date'];
//     userId = json['user_id'];
//     packageId = json['package_id'];
//     userName = json['user_name'];
//     packageName = json['package_name'];
//     branchName = json['branch_name'];
//     activeStatus = json['active_status'];
//     package = json['package'] != null ? Package.fromJson(json['package']) : null;
//     branch = json['branch'] != null ? Branch.fromJson(json['branch']) : null;
//     address = json['address'] != null ? Address.fromJson(json['address']) : null;
//     period = json['period'] != null ? Period.fromJson(json['period']) : null;
//     user = json['user'] != null ? User.fromJson(json['user']) : null;
//   }
//   int? id;
//   int? branchId;
//   int? addressId;
//   String? deliveryType;
//   int? periodId;
//   String? startDate;
//   String? endDate;
//   int? userId;
//   int? packageId;
//   String? userName;
//   String? packageName;
//   String? branchName;
//   bool? activeStatus;
//   Package? package;
//   Branch? branch;
//   Address? address;
//   Period? period;
//   User? user;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['branch_id'] = branchId;
//     map['address_id'] = addressId;
//     map['delivery_type'] = deliveryType;
//     map['period_id'] = periodId;
//     map['start_date'] = startDate;
//     map['end_date'] = endDate;
//     map['user_id'] = userId;
//     map['package_id'] = packageId;
//     map['user_name'] = userName;
//     map['package_name'] = packageName;
//     map['branch_name'] = branchName;
//     map['active_status'] = activeStatus;
//     if (package != null) {
//       map['package'] = package?.toJson();
//     }
//     if (branch != null) {
//       map['branch'] = branch?.toJson();
//     }
//     if (address != null) {
//       map['address'] = address?.toJson();
//     }
//     if (period != null) {
//       map['period'] = period?.toJson();
//     }
//     if (user != null) {
//       map['user'] = user?.toJson();
//     }
//     return map;
//   }
//
// }
//
// class User {
//   User({
//     this.id,
//     this.nameEn,
//     this.email,
//     this.emailVerifiedAt,
//     this.type,
//     this.nameAr,
//     this.image,
//     this.status,
//     this.mobile,
//     this.smsCode,
//     this.emailVerifyCode,
//     this.verified,
//     this.locale,
//     this.deviceToken,
//     this.name,
//     this.firstName,
//     this.lastName,
//     this.additionalData,});
//
//   User.fromJson(dynamic json) {
//     id = json['id'];
//     nameEn = json['name_en'];
//     email = json['email'];
//     emailVerifiedAt = json['email_verified_at'];
//     type = json['type'];
//     nameAr = json['name_ar'];
//     image = json['image'];
//     status = json['status'];
//     mobile = json['mobile'];
//     smsCode = json['sms_code'];
//     emailVerifyCode = json['email_verify_code'];
//     verified = json['verified'];
//     locale = json['locale'];
//     deviceToken = json['device_token'];
//     name = json['name'];
//     firstName = json['first_name'];
//     lastName = json['last_name'];
//     additionalData = json['additional_data'];
//   }
//   int? id;
//   String? nameEn;
//   String? email;
//   String? emailVerifiedAt;
//   String? type;
//   String? nameAr;
//   String? image;
//   int? status;
//   String? mobile;
//   String? smsCode;
//   dynamic emailVerifyCode;
//   int? verified;
//   dynamic locale;
//   dynamic deviceToken;
//   String? name;
//   String? firstName;
//   String? lastName;
//   dynamic additionalData;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['name_en'] = nameEn;
//     map['email'] = email;
//     map['email_verified_at'] = emailVerifiedAt;
//     map['type'] = type;
//     map['name_ar'] = nameAr;
//     map['image'] = image;
//     map['status'] = status;
//     map['mobile'] = mobile;
//     map['sms_code'] = smsCode;
//     map['email_verify_code'] = emailVerifyCode;
//     map['verified'] = verified;
//     map['locale'] = locale;
//     map['device_token'] = deviceToken;
//     map['name'] = name;
//     map['first_name'] = firstName;
//     map['last_name'] = lastName;
//     map['additional_data'] = additionalData;
//     return map;
//   }
//
// }
//
// class Period {
//   Period({
//     this.id,
//     this.period,});
//
//   Period.fromJson(dynamic json) {
//     id = json['id'];
//     period = json['period'];
//   }
//   int? id;
//   String? period;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['period'] = period;
//     return map;
//   }
//
// }
//
// class Address {
//   Address({
//     this.id,
//     this.lat,
//     this.lng,
//     this.name,
//     this.addressType,
//     this.area,
//     this.building,
//     this.flat,
//     this.street,
//     this.postalCode,
//     this.additionalNumber,
//     this.deliveryInstructions,});
//
//   Address.fromJson(dynamic json) {
//     id = json['id'];
//     lat = json['lat'];
//     lng = json['lng'];
//     name = json['name'];
//     addressType = json['address_type'];
//     area = json['area'];
//     building = json['building'];
//     flat = json['flat'];
//     street = json['street'];
//     postalCode = json['postal_code'];
//     additionalNumber = json['additional_number'];
//     deliveryInstructions = json['delivery_instructions'];
//   }
//   int? id;
//   double? lat;
//   double? lng;
//   String? name;
//   String? addressType;
//   String? area;
//   String? building;
//   String? flat;
//   String? street;
//   String? postalCode;
//   String? additionalNumber;
//   dynamic deliveryInstructions;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['lat'] = lat;
//     map['lng'] = lng;
//     map['name'] = name;
//     map['address_type'] = addressType;
//     map['area'] = area;
//     map['building'] = building;
//     map['flat'] = flat;
//     map['street'] = street;
//     map['postal_code'] = postalCode;
//     map['additional_number'] = additionalNumber;
//     map['delivery_instructions'] = deliveryInstructions;
//     return map;
//   }
//
// }
//
// class Branch {
//   Branch({
//     this.id,
//     this.googleAddress,
//     this.mobile,
//     this.coverageArea,
//     this.lat,
//     this.lng,
//     this.branchCapacity,
//     this.branchPickupCapacity,
//     this.deliveryFees,
//     this.delivery,
//     this.pickup,
//     this.name,
//     this.address,
//     this.pickupPeriods,
//     this.deliveryPeriods,
//     this.workTimes,});
//
//   Branch.fromJson(dynamic json) {
//     id = json['id'];
//     googleAddress = json['google_address'];
//     mobile = json['mobile'];
//     coverageArea = json['coverage_area'];
//     lat = json['lat'];
//     lng = json['lng'];
//     branchCapacity = json['branch_capacity'];
//     branchPickupCapacity = json['branch_pickup_capacity'];
//     deliveryFees = json['delivery_fees'];
//     delivery = json['delivery'];
//     pickup = json['pickup'];
//     name = json['name'];
//     address = json['address'];
//     if (json['pickup_periods'] != null) {
//       pickupPeriods = [];
//       json['pickup_periods'].forEach((v) {
//         pickupPeriods?.add(PickupPeriods.fromJson(v));
//       });
//     }
//     if (json['delivery_periods'] != null) {
//       deliveryPeriods = [];
//       json['delivery_periods'].forEach((v) {
//         deliveryPeriods?.add(DeliveryPeriods.fromJson(v));
//       });
//     }
//     if (json['work_times'] != null) {
//       workTimes = [];
//       json['work_times'].forEach((v) {
//         workTimes?.add(WorkTimes.fromJson(v));
//       });
//     }
//   }
//   int? id;
//   String? googleAddress;
//   String? mobile;
//   int? coverageArea;
//   double? lat;
//   double? lng;
//   int? branchCapacity;
//   int? branchPickupCapacity;
//   int? deliveryFees;
//   int? delivery;
//   int? pickup;
//   String? name;
//   String? address;
//   List<PickupPeriods>? pickupPeriods;
//   List<DeliveryPeriods>? deliveryPeriods;
//   List<WorkTimes>? workTimes;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['google_address'] = googleAddress;
//     map['mobile'] = mobile;
//     map['coverage_area'] = coverageArea;
//     map['lat'] = lat;
//     map['lng'] = lng;
//     map['branch_capacity'] = branchCapacity;
//     map['branch_pickup_capacity'] = branchPickupCapacity;
//     map['delivery_fees'] = deliveryFees;
//     map['delivery'] = delivery;
//     map['pickup'] = pickup;
//     map['name'] = name;
//     map['address'] = address;
//     if (pickupPeriods != null) {
//       map['pickup_periods'] = pickupPeriods?.map((v) => v.toJson()).toList();
//     }
//     if (deliveryPeriods != null) {
//       map['delivery_periods'] = deliveryPeriods?.map((v) => v.toJson()).toList();
//     }
//     if (workTimes != null) {
//       map['work_times'] = workTimes?.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
//
// }
//
// class WorkTimes {
//   WorkTimes({
//     this.id,
//     this.data,
//     this.branchId,});
//
//   WorkTimes.fromJson(dynamic json) {
//     id = json['id'];
//     data = json['data'];
//     branchId = json['branch_id'];
//   }
//   int? id;
//   String? data;
//   int? branchId;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['data'] = data;
//     map['branch_id'] = branchId;
//     return map;
//   }
//
// }
//
// class DeliveryPeriods {
//   DeliveryPeriods({
//     this.id,
//     this.period,
//     this.pivot1,});
//
//   DeliveryPeriods.fromJson(dynamic json) {
//     id = json['id'];
//     period = json['period'];
//     pivot1 = json['pivot'] != null ? Pivot1.fromJson(json['pivot']) : null;
//   }
//   int? id;
//   String? period;
//   Pivot1? pivot1;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['period'] = period;
//     if (pivot1 != null) {
//       map['pivot'] = pivot1?.toJson();
//     }
//     return map;
//   }
//
// }
//
// class Pivot1 {
//   Pivot1({
//     this.branchId,
//     this.periodId,});
//
//   Pivot1.fromJson(dynamic json) {
//     branchId = json['branch_id'];
//     periodId = json['period_id'];
//   }
//   int? branchId;
//   int? periodId;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['branch_id'] = branchId;
//     map['period_id'] = periodId;
//     return map;
//   }
//
// }
//
// class PickupPeriods {
//   PickupPeriods({
//     this.id,
//     this.period,
//     this.pivot,});
//
//   PickupPeriods.fromJson(dynamic json) {
//     id = json['id'];
//     period = json['period'];
//     pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
//   }
//   int? id;
//   String? period;
//   Pivot? pivot;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['period'] = period;
//     if (pivot != null) {
//       map['pivot'] = pivot?.toJson();
//     }
//     return map;
//   }
//
// }
//
// class Pivot {
//   Pivot({
//     this.branchId,
//     this.periodId,});
//
//   Pivot.fromJson(dynamic json) {
//     branchId = json['branch_id'];
//     periodId = json['period_id'];
//   }
//   int? branchId;
//   int? periodId;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['branch_id'] = branchId;
//     map['period_id'] = periodId;
//     return map;
//   }
//
// }
//
// class Package {
//   Package({
//     this.id,
//     this.image,
//     this.tax,
//     this.priceWithTax,
//     this.type,
//     this.daysNumberOfWeek,
//     this.name,});
//
//   Package.fromJson(dynamic json) {
//     id = json['id'];
//     image = json['image'];
//     tax = json['tax'];
//     priceWithTax = json['price_with_tax'];
//     type = json['type'];
//     daysNumberOfWeek = json['days_number_of_week'];
//     name = json['name'];
//   }
//   int? id;
//   String? image;
//   int? tax;
//   int? priceWithTax;
//   String? type;
//   int? daysNumberOfWeek;
//   String? name;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['image'] = image;
//     map['tax'] = tax;
//     map['price_with_tax'] = priceWithTax;
//     map['type'] = type;
//     map['days_number_of_week'] = daysNumberOfWeek;
//     map['name'] = name;
//     return map;
//   }
//
// }