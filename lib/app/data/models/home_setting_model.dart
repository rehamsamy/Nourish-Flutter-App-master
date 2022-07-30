class HomeSettingModel {
  HomeSettingModel({
      this.data,});

  HomeSettingModel.fromJson(dynamic json) {
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
      this.searchAndFilter, 
      this.productsMenu, 
      this.newPackages, 
      this.customizePackage, 
      this.cancelSubscription, 
      this.shippingAddress, 
      this.shippingTime, 
      this.offDaysPickupSaturday, 
      this.offDaysPickupSunday, 
      this.offDaysPickupMonday, 
      this.offDaysPickupTuesday, 
      this.offDaysPickupWednesday, 
      this.offDaysPickupThursday, 
      this.offDaysPickupFriday, 
      this.offDaysDeliverySaturday, 
      this.offDaysDeliverySunday, 
      this.offDaysDeliveryMonday, 
      this.offDaysDeliveryTuesday, 
      this.offDaysDeliveryWednesday, 
      this.offDaysDeliveryThursday, 
      this.offDaysDeliveryFriday,});

  Data.fromJson(dynamic json) {
    searchAndFilter = json['search_and_filter'];
    productsMenu = json['products_menu'];
    newPackages = json['new_packages'];
    customizePackage = json['customize_package'];
    cancelSubscription = json['cancel_subscription'];
    shippingAddress = json['shipping_address'];
    shippingTime = json['shipping_time'];
    offDaysPickupSaturday = json['off_days_pickup_saturday'];
    offDaysPickupSunday = json['off_days_pickup_sunday'];
    offDaysPickupMonday = json['off_days_pickup_monday'];
    offDaysPickupTuesday = json['off_days_pickup_tuesday'];
    offDaysPickupWednesday = json['off_days_pickup_wednesday'];
    offDaysPickupThursday = json['off_days_pickup_thursday'];
    offDaysPickupFriday = json['off_days_pickup_friday'];
    offDaysDeliverySaturday = json['off_days_delivery_saturday'];
    offDaysDeliverySunday = json['off_days_delivery_sunday'];
    offDaysDeliveryMonday = json['off_days_delivery_monday'];
    offDaysDeliveryTuesday = json['off_days_delivery_tuesday'];
    offDaysDeliveryWednesday = json['off_days_delivery_wednesday'];
    offDaysDeliveryThursday = json['off_days_delivery_thursday'];
    offDaysDeliveryFriday = json['off_days_delivery_friday'];
  }
  String? searchAndFilter;
  String? productsMenu;
  String? newPackages;
  String? customizePackage;
  String? cancelSubscription;
  String? shippingAddress;
  String? shippingTime;
  String? offDaysPickupSaturday;
  String? offDaysPickupSunday;
  String? offDaysPickupMonday;
  String? offDaysPickupTuesday;
  String? offDaysPickupWednesday;
  String? offDaysPickupThursday;
  String? offDaysPickupFriday;
  String? offDaysDeliverySaturday;
  String? offDaysDeliverySunday;
  String? offDaysDeliveryMonday;
  String? offDaysDeliveryTuesday;
  String? offDaysDeliveryWednesday;
  String? offDaysDeliveryThursday;
  String? offDaysDeliveryFriday;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['search_and_filter'] = searchAndFilter;
    map['products_menu'] = productsMenu;
    map['new_packages'] = newPackages;
    map['customize_package'] = customizePackage;
    map['cancel_subscription'] = cancelSubscription;
    map['shipping_address'] = shippingAddress;
    map['shipping_time'] = shippingTime;
    map['off_days_pickup_saturday'] = offDaysPickupSaturday;
    map['off_days_pickup_sunday'] = offDaysPickupSunday;
    map['off_days_pickup_monday'] = offDaysPickupMonday;
    map['off_days_pickup_tuesday'] = offDaysPickupTuesday;
    map['off_days_pickup_wednesday'] = offDaysPickupWednesday;
    map['off_days_pickup_thursday'] = offDaysPickupThursday;
    map['off_days_pickup_friday'] = offDaysPickupFriday;
    map['off_days_delivery_saturday'] = offDaysDeliverySaturday;
    map['off_days_delivery_sunday'] = offDaysDeliverySunday;
    map['off_days_delivery_monday'] = offDaysDeliveryMonday;
    map['off_days_delivery_tuesday'] = offDaysDeliveryTuesday;
    map['off_days_delivery_wednesday'] = offDaysDeliveryWednesday;
    map['off_days_delivery_thursday'] = offDaysDeliveryThursday;
    map['off_days_delivery_friday'] = offDaysDeliveryFriday;
    return map;
  }

}