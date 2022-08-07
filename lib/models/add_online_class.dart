import 'package:json_annotation/json_annotation.dart';
part 'add_online_class.g.dart';

@JsonSerializable()
class AddOnlineClass {
  String? link;
  DateTime? date;
  int? teacher_subject_id;
  int? id;
  AddOnlineClass({
    this.date,
    this.link,
    this.id,
    this.teacher_subject_id,
  });
  factory AddOnlineClass.fromJson(Map<String, dynamic> json) =>
      _$AddOnlineClassFromJson(json);
  Map<String, dynamic> toJson() => _$AddOnlineClassToJson(this);
}

@JsonSerializable()
class FAddOnlineClass {
  bool? status;
  String? message;
  List<AddOnlineClass>? data;
  FAddOnlineClass({
    this.data,
    this.message,
    this.status,
  });
  factory FAddOnlineClass.fromJson(Map<String, dynamic> json) =>
      _$FAddOnlineClassFromJson(json);
  Map<String, dynamic> toJson() => _$FAddOnlineClassToJson(this);
}
