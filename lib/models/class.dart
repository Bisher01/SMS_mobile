import 'package:json_annotation/json_annotation.dart';

part 'class.g.dart';

@JsonSerializable()
class Class {
  @JsonKey(defaultValue: 0)
  int? id;
  @JsonKey(defaultValue: '')
  String? name;
  @JsonKey(defaultValue: 0)
  int? grade_id;

  Class({
    this.id,
    this.name,
    this.grade_id,
  });

  factory Class.fromJson(Map<String, dynamic> json) => _$ClassFromJson(json);
  Map<String, dynamic> toJson() => _$ClassToJson(this);
}
