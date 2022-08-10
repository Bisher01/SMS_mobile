import 'package:json_annotation/json_annotation.dart';

part 'parent.g.dart';

@JsonSerializable()
class Parent {
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

  Parent(
      {this.id,
      this.phone,
      this.code,
      this.email,
      this.father_name,
      this.jop,
      this.mother_name,
      this.national_number,});

  factory Parent.fromJson(Map<String, dynamic> json) => _$ParentFromJson(json);
  Map<String, dynamic> toJson() => _$ParentToJson(this);
}

@JsonSerializable()
class FParent {
  bool? status;
  String? message;
  List<Parent>? parent;
  FParent({this.message, this.status, this.parent});

  factory FParent.fromJson(Map<String, dynamic> json) =>
      _$FParentFromJson(json);
  Map<String, dynamic> toJson() => _$FParentToJson(this);
}
