import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'student_online_class.g.dart';

@JsonSerializable()
class StudentOnlineClass {
  int? id;
  String? link;
  DateTime? date;
  int? teacher_subject_id;
  StudentTeacherSubjects? teacher_subject;

  StudentOnlineClass({
    this.id,
    this.date,
    this.teacher_subject_id,
    this.link,
    this.teacher_subject,
  });

  factory StudentOnlineClass.fromJson(Map<String, dynamic> json) =>
      _$StudentOnlineClassFromJson(json);
  Map<String, dynamic> toJson() => _$StudentOnlineClassToJson(this);
}

@JsonSerializable()
class FStudentOnlineClass {
  bool? status;
  String? message;
  List<StudentOnlineClass>? data;
  FStudentOnlineClass({this.message, this.status, this.data});

  factory FStudentOnlineClass.fromJson(Map<String, dynamic> json) =>
      _$FStudentOnlineClassFromJson(json);
  Map<String, dynamic> toJson() => _$FStudentOnlineClassToJson(this);
}

@JsonSerializable()
class StudentTeacherSubjects {
  int? id;
  int? subject_id;
  int? teacher_id;
  int? class_classroom_id;
  Subject? subjects;
  StudentTeacher? teachers;

  StudentTeacherSubjects({
    this.id,
    this.subject_id,
    this.subjects,
    this.class_classroom_id,
    this.teacher_id,
    this.teachers,
  });

  factory StudentTeacherSubjects.fromJson(Map<String, dynamic> json) =>
      _$StudentTeacherSubjectsFromJson(json);
  Map<String, dynamic> toJson() => _$StudentTeacherSubjectsToJson(this);
}

@JsonSerializable()
class StudentTeacher {
  int? id;
  String? f_name;
  String? l_name;
  String? email;
  String? code;
  String? joining_date;
  @JsonKey(defaultValue: '')
  String? picture;
  String? salary;
  int? address_id;
  int? religion_id;
  int? gender_id;
  StudentTeacher({
    this.id,
    this.picture,
    this.salary,
    this.religion_id,
    this.gender_id,
    this.f_name,
    this.joining_date,
    this.code,
    this.l_name,
    this.email,
    this.address_id,
  });

  factory StudentTeacher.fromJson(Map<String, dynamic> json) =>
      _$StudentTeacherFromJson(json);
  Map<String, dynamic> toJson() => _$StudentTeacherToJson(this);
}
