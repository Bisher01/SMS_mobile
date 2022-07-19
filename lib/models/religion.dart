import 'package:json_annotation/json_annotation.dart';

part 'religion.g.dart';

@JsonSerializable()
class Religion {
  int? id;
  String? name;

  Religion({
    this.id,
    this.name,
  });

  factory Religion.fromJson(Map<String, dynamic> json) => _$ReligionFromJson(json);
  Map<String, dynamic> toJson() => _$ReligionToJson(this);
}
