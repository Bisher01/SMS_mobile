import 'package:json_annotation/json_annotation.dart';

part 'delete.g.dart';

@JsonSerializable()
class Delete{
  bool? status;
  String? message;
  Delete({
    this.message,
    this.status,

  });

  factory Delete.fromJson(Map<String, dynamic> json) =>
      _$DeleteFromJson(json);
  Map<String, dynamic> toJson() => _$DeleteToJson(this);

}
