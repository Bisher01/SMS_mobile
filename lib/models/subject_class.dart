import 'package:json_annotation/json_annotation.dart';
import 'package:sms_mobile/models/models.dart';
part 'subject_class.g.dart';

@JsonSerializable()
class SubjectClass {
  bool? status;
  String? message;
  List<TeacherData>? data;

  SubjectClass({
    this.status,
    this.message,
    this.data,
  });

  factory SubjectClass.fromJson(Map<String, dynamic> json) =>
      _$SubjectClassFromJson(json);
  Map<String, dynamic> toJson() => _$SubjectClassToJson(this);
}

@JsonSerializable()
class TeacherData {
  @JsonKey(defaultValue: 0)
  int? id;
  @JsonKey(defaultValue: '')
  String? name;
  List<ClassClassroom>? class_classroom;

  TeacherData({
    this.class_classroom,
    this.id,
    this.name,
  });

  factory TeacherData.fromJson(Map<String, dynamic> json) =>
      _$TeacherDataFromJson(json);
  Map<String, dynamic> toJson() => _$TeacherDataToJson(this);
}


@JsonSerializable()
class ClassClassroom {
  @JsonKey(defaultValue: 0)
  int? id;
  @JsonKey(defaultValue: 0)
  int? class_id;
  @JsonKey(defaultValue: 0)
  int? classroom_id;
  Classes? classes;
  Classroom? classrooms;

  ClassClassroom({
    this.id,
    this.classes,
    this.class_id,
    this.classroom_id,
    this.classrooms,
  });

  factory ClassClassroom.fromJson(Map<String, dynamic> json) =>
      _$ClassClassroomFromJson(json);
  Map<String, dynamic> toJson() => _$ClassClassroomToJson(this);
}
