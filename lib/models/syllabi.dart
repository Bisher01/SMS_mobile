/*{
    "status": true,
    "message": "syllabi",
    "syllabi": [
        {
            "id": 1,
            "content": "/2022/syllabi/alissar/ الصف الاول/n1Hchab5UwolKm3IfIlbMHtD4pfvG2TSMiAOWlkz.pdf",
            "class_id": 1,
            "subject_id": 1,
            "created_at": "2022-07-07T23:01:29.000000Z",
            "updated_at": "2022-07-07T23:01:29.000000Z"
        }
    ]
}*/
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
