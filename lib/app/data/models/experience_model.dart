class ExperienceModel {
  ExperienceModel({
      this.data,});

  ExperienceModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ExperienceItem.fromJson(v));
      });
    }
  }
  List<ExperienceItem>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class ExperienceItem {
  ExperienceItem({
      this.id, 
      this.value, 
      this.key,});

  ExperienceItem.fromJson(dynamic json) {
    id = json['id'];
    value = json['value'];
    key = json['key'];
  }
  int? id;
  int? value;
  String? key;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['value'] = value;
    map['key'] = key;
    return map;
  }

}