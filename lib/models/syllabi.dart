import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'syllabi.g.dart';


@JsonSerializable()
class Syllabi {
  @JsonKey(defaultValue: 0)
  int? id;
  @JsonKey(defaultValue: '')
  String? content;
  @JsonKey(defaultValue: 0)
  int? class_id;
  @JsonKey(defaultValue: 0)
  int? subject_id;
  @JsonKey(defaultValue: 0)
  int? active;
  @JsonKey(name: 'class')
  Class? classes;
  Subject? subject;


  Syllabi({
    this.id,
    this.class_id,
    this.subject_id,
    this.content,
    this.active,
    this.subject,
    this.classes,
  });

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
