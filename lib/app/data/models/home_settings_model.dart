class HomeSettingsModel {
  Data? data;

  HomeSettingsModel({this.data});

  HomeSettingsModel.fromJson(Map<String, dynamic> json) {
    if (json["data"] is Map) {
      if (json["data"] == null) {
        data = null;
      } else {
        data = Data.fromJson(json["data"]);
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data["data"] = this.data?.toJson();
    }
    return data;
  }
}

class Data {
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

  Data(
      {this.searchAndFilter,
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
      this.offDaysDeliveryFriday});

  Data.fromJson(Map<String, dynamic> json) {
    if (json["search_and_filter"] is String) {
      searchAndFilter = json["search_and_filter"];
    }
    if (json["products_menu"] is String) {
      productsMenu = json["products_menu"];
    }
    if (json["new_packages"] is String) {
      newPackages = json["new_packages"];
    }
    if (json["customize_package"] is String) {
      customizePackage = json["customize_package"];
    }
    if (json["cancel_subscription"] is String) {
      cancelSubscription = json["cancel_subscription"];
    }
    if (json["shipping_address"] is String) {
      shippingAddress = json["shipping_address"];
    }
    if (json["shipping_time"] is String) {
      shippingTime = json["shipping_time"];
    }
    if (json["off_days_pickup_saturday"] is String) {
      offDaysPickupSaturday = json["off_days_pickup_saturday"];
    }
    if (json["off_days_pickup_sunday"] is String) {
      offDaysPickupSunday = json["off_days_pickup_sunday"];
    }
    if (json["off_days_pickup_monday"] is String) {
      offDaysPickupMonday = json["off_days_pickup_monday"];
    }
    if (json["off_days_pickup_tuesday"] is String) {
      offDaysPickupTuesday = json["off_days_pickup_tuesday"];
    }
    if (json["off_days_pickup_wednesday"] is String) {
      offDaysPickupWednesday = json["off_days_pickup_wednesday"];
    }
    if (json["off_days_pickup_thursday"] is String) {
      offDaysPickupThursday = json["off_days_pickup_thursday"];
    }
    if (json["off_days_pickup_friday"] is String) {
      offDaysPickupFriday = json["off_days_pickup_friday"];
    }
    if (json["off_days_delivery_saturday"] is String) {
      offDaysDeliverySaturday = json["off_days_delivery_saturday"];
    }
    if (json["off_days_delivery_sunday"] is String) {
      offDaysDeliverySunday = json["off_days_delivery_sunday"];
    }
    if (json["off_days_delivery_monday"] is String) {
      offDaysDeliveryMonday = json["off_days_delivery_monday"];
    }
    if (json["off_days_delivery_tuesday"] is String) {
      offDaysDeliveryTuesday = json["off_days_delivery_tuesday"];
    }
    if (json["off_days_delivery_wednesday"] is String) {
      offDaysDeliveryWednesday = json["off_days_delivery_wednesday"];
    }
    if (json["off_days_delivery_thursday"] is String) {
      offDaysDeliveryThursday = json["off_days_delivery_thursday"];
    }
    if (json["off_days_delivery_friday"] is String) {
      offDaysDeliveryFriday = json["off_days_delivery_friday"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["search_and_filter"] = searchAndFilter;
    data["products_menu"] = productsMenu;
    data["new_packages"] = newPackages;
    data["customize_package"] = customizePackage;
    data["cancel_subscription"] = cancelSubscription;
    data["shipping_address"] = shippingAddress;
    data["shipping_time"] = shippingTime;
    data["off_days_pickup_saturday"] = offDaysPickupSaturday;
    data["off_days_pickup_sunday"] = offDaysPickupSunday;
    data["off_days_pickup_monday"] = offDaysPickupMonday;
    data["off_days_pickup_tuesday"] = offDaysPickupTuesday;
    data["off_days_pickup_wednesday"] = offDaysPickupWednesday;
    data["off_days_pickup_thursday"] = offDaysPickupThursday;
    data["off_days_pickup_friday"] = offDaysPickupFriday;
    data["off_days_delivery_saturday"] = offDaysDeliverySaturday;
    data["off_days_delivery_sunday"] = offDaysDeliverySunday;
    data["off_days_delivery_monday"] = offDaysDeliveryMonday;
    data["off_days_delivery_tuesday"] = offDaysDeliveryTuesday;
    data["off_days_delivery_wednesday"] = offDaysDeliveryWednesday;
    data["off_days_delivery_thursday"] = offDaysDeliveryThursday;
    data["off_days_delivery_friday"] = offDaysDeliveryFriday;
    return data;
  }
}
