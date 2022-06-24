class NotificationModel {
  NotificationModel({
      this.data,});

  NotificationModel.fromJson(dynamic json) {
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
      this.notificationdata, 
      this.paginate,});

  Data.fromJson(dynamic json) {
    if (json['data'] != null) {
      notificationdata = [];
      json['data'].forEach((v) {
        notificationdata?.add(NotificationItem.fromJson(v));
      });
    }
    paginate = json['paginate'] != null ? Paginate.fromJson(json['paginate']) : null;
  }
  List<NotificationItem>? notificationdata;
  Paginate? paginate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (notificationdata != null) {
      map['data'] = notificationdata?.map((v) => v.toJson()).toList();
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

class NotificationItem {
  NotificationItem({
      this.id, 
      this.text, 
      this.time,});

  NotificationItem.fromJson(dynamic json) {
    id = json['id'];
    text = json['text'];
    time = json['time'];
  }
  int? id;
  String? text;
  String? time;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['text'] = text;
    map['time'] = time;
    return map;
  }

}