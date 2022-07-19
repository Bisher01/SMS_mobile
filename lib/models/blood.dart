import 'package:json_annotation/json_annotation.dart';

part 'blood.g.dart';

@JsonSerializable()
class Blood {
  int? id;
  String? type;

  Blood({
    this.id,
    this.type,
  });

  factory Blood.fromJson(Map<String, dynamic> json) => _$BloodFromJson(json);
  Map<String, dynamic> toJson() => _$BloodToJson(this);
}
