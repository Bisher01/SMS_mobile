import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'teacher_online_class.g.dart';

@JsonSerializable()
class TeacherOnlineClass {
  int? id;
  String? link;
  DateTime? date;
  int? teacher_subject_id;
  TeacherSubjects? teacher_subject;

  TeacherOnlineClass({
    this.id,
    this.date,
    this.teacher_subject_id,
    this.link,
    this.teacher_subject,
  });

  factory TeacherOnlineClass.fromJson(Map<String, dynamic> json) =>
      _$TeacherOnlineClassFromJson(json);
  Map<String, dynamic> toJson() => _$TeacherOnlineClassToJson(this);
}

@JsonSerializable()
class FTeacherOnlineClass {
  bool? status;
  String? message;
  List<TeacherOnlineClass>? data;
  FTeacherOnlineClass({this.message, this.status, this.data});

  factory FTeacherOnlineClass.fromJson(Map<String, dynamic> json) =>
      _$FTeacherOnlineClassFromJson(json);
  Map<String, dynamic> toJson() => _$FTeacherOnlineClassToJson(this);
}

@JsonSerializable()
class TeacherSubjects {
  int? id;
  int? subject_id;
  int? teacher_id;
  int? class_classroom_id;
  Subject? subjects;
  ClassClassroom? class_classrooms;

  TeacherSubjects({
    this.id,
    this.subject_id,
    this.subjects,
    this.class_classroom_id,
    this.teacher_id,
    this.class_classrooms,
  });

  factory TeacherSubjects.fromJson(Map<String, dynamic> json) =>
      _$TeacherSubjectsFromJson(json);
  Map<String, dynamic> toJson() => _$TeacherSubjectsToJson(this);
}
