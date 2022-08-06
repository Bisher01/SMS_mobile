import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'syllabi.g.dart';
/*
{
    "status": true,
    "message": "syllabi",
    "syllabi": [
        {
            "id": 1,
            "content": "/2022/syllabi/alissar0__الصف_الاول/Swvl9rVlOGiFirmAXMlV1cDCfOiRrCT6Nf4y9aaG.pdf",
            "class_id": 1,
            "subject_id": 1,
            "subject": {
                "id": 1,
                "name": "alissar0"
            },
            "class": {
                "id": 1,
                "name": " الصف الاول",
                "grade_id": 1
            }
        }
    ]
}
*/

@JsonSerializable()
class Syllabi {
  int? id;
  String? content;
  int? class_id;
  int? subject_id;
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
  List<Syllabi>? data;
  FSyllabi({this.message, this.status, this.data});

  factory FSyllabi.fromJson(Map<String, dynamic> json) =>
      _$FSyllabiFromJson(json);
  Map<String, dynamic> toJson() => _$FSyllabiToJson(this);
}
