import 'package:json_annotation/json_annotation.dart';
import 'package:sms_mobile/models/student.dart';

part 'new_parent.g.dart';

@JsonSerializable()
class FNewParent {
  bool? status;
  String? message;
  List<NewParent>? parent;
  FNewParent({
    this.status,
    this.message,
    this.parent,
  });

  factory FNewParent.fromJson(Map<String, dynamic> json) =>
      _$FNewParentFromJson(json);
  Map<String, dynamic> toJson() => _$FNewParentToJson(this);
}

@JsonSerializable()
class NewParent {
  @JsonKey(defaultValue: 0)
  int? id;
  @JsonKey(defaultValue: '')
  String? national_number;
  @JsonKey(defaultValue: '')
  String? mother_name;
  @JsonKey(defaultValue: '')
  String? father_name;
  @JsonKey(defaultValue: '')
  String? code;
  @JsonKey(defaultValue: '')
  String? phone;
  @JsonKey(defaultValue: '')
  String? email;
  @JsonKey(defaultValue: '')
  String? jop;
  List<Student>? child;

  NewParent(
      {this.id,
      this.phone,
      this.code,
      this.email,
      this.father_name,
      this.jop,
      this.mother_name,
      this.national_number});

  factory NewParent.fromJson(Map<String, dynamic> json) =>
      _$NewParentFromJson(json);
  Map<String, dynamic> toJson() => _$NewParentToJson(this);
}
