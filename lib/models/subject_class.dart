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
  int? grade_id;
  List<Subjects>? subjects;

  TeacherData(
      {this.subjects,
      this.id,
      this.picture,
      this.code,
      this.email,
      this.grade_id,
      this.religion_id,
      this.gender_id,
      this.address_id,
      this.salary,
      this.joining_date,
      this.l_name,
      this.f_name});

  factory TeacherData.fromJson(Map<String, dynamic> json) =>
      _$TeacherDataFromJson(json);
  Map<String, dynamic> toJson() => _$TeacherDataToJson(this);
}

@JsonSerializable()
class Subjects {
  int? id;
  String? name;
  List<ClassClassroom>? class_classroom;

  Subjects({
    this.id,
    this.name,
    this.class_classroom,
  });

  factory Subjects.fromJson(Map<String, dynamic> json) =>
      _$SubjectsFromJson(json);
  Map<String, dynamic> toJson() => _$SubjectsToJson(this);
}

@JsonSerializable()
class ClassClassroom {
  int? id;
  int? class_id;
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
