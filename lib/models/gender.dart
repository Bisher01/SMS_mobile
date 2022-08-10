import 'package:json_annotation/json_annotation.dart';

part 'gender.g.dart';

@JsonSerializable()
class Gender {
  @JsonKey(defaultValue: 0)
  int? id;
  @JsonKey(defaultValue: '')
  String? type;

  Gender({
    this.id,
    this.type,
  });

  factory Gender.fromJson(Map<String, dynamic> json) => _$GenderFromJson(json);
  Map<String, dynamic> toJson() => _$GenderToJson(this);
}
