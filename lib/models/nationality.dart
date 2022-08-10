import 'package:json_annotation/json_annotation.dart';

part 'nationality.g.dart';

@JsonSerializable()
class Nationality {
  @JsonKey(defaultValue: 0)
  int? id;
  @JsonKey(defaultValue: '')
  String? name;

  Nationality({
    this.id,
    this.name,
  });

  factory Nationality.fromJson(Map<String, dynamic> json) =>
      _$NationalityFromJson(json);
  Map<String, dynamic> toJson() => _$NationalityToJson(this);
}
