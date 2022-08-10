import 'package:json_annotation/json_annotation.dart';

part 'grade.g.dart';

@JsonSerializable()
class Grade {
  @JsonKey(defaultValue: 0)
  int? id;
  @JsonKey(defaultValue: '')
  String? name;

  Grade({this.id,  this.name});

  factory Grade.fromJson(Map<String, dynamic> json) =>
      _$GradeFromJson(json);
  Map<String, dynamic> toJson() => _$GradeToJson(this);
}