import 'package:json_annotation/json_annotation.dart';

part 'religion.g.dart';

@JsonSerializable()
class Religion {
  @JsonKey(defaultValue: 0)
  int? id;
  @JsonKey(defaultValue: '')
  String? name;

  Religion({
    this.id,
    this.name,
  });

  factory Religion.fromJson(Map<String, dynamic> json) => _$ReligionFromJson(json);
  Map<String, dynamic> toJson() => _$ReligionToJson(this);
}
