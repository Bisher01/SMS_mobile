import 'package:json_annotation/json_annotation.dart';

part 'syllabi.g.dart';

@JsonSerializable()
class Syllabi {
  int? id;
  String? content;
  int? class_id;
  int? subject_id;
  String? created_at;
  String? updated_at;

  Syllabi(
      {this.id,
      this.updated_at,
      this.created_at,
      this.class_id,
      this.subject_id,
      this.content});

  factory Syllabi.fromJson(Map<String, dynamic> json) =>
      _$SyllabiFromJson(json);
  Map<String, dynamic> toJson() => _$SyllabiToJson(this);
}

@JsonSerializable()
class FSyllabi {
  bool? status;
  String? message;
  List<Syllabi>? syllabi;
  FSyllabi({this.message, this.status, this.syllabi});

  factory FSyllabi.fromJson(Map<String, dynamic> json) =>
      _$FSyllabiFromJson(json);
  Map<String, dynamic> toJson() => _$FSyllabiToJson(this);
}
