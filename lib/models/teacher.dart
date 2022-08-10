import 'package:json_annotation/json_annotation.dart';
import '../models/models.dart';
part 'teacher.g.dart';

@JsonSerializable()
class Teacher {
  @JsonKey(defaultValue: 0)
  int? id;
  @JsonKey(defaultValue: '')
  String? f_name;
  @JsonKey(defaultValue: '')
  String? l_name;
  @JsonKey(defaultValue: '')
  String? email;
  @JsonKey(defaultValue: '')
  String? code;
  @JsonKey(defaultValue: '')
  String? joining_date;
  @JsonKey(defaultValue: '')
  String? picture;
  @JsonKey(defaultValue: '')
  String? salary;
  @JsonKey(defaultValue: 0)
  int? address_id;
  @JsonKey(defaultValue: 0)
  int? religion_id;
  @JsonKey(defaultValue: 0)
  int? gender_id;
  @JsonKey(defaultValue: 0)
  int? grade_id;
  Gender? gender;
  Religion? religion;
  Address? address;
  Grade? grade;
  List<Subject>? subjects;

  Teacher({
    this.picture,
    this.address_id,
    this.religion_id,
    this.code,
    this.email,
    this.f_name,
    this.gender_id,
    this.grade_id,
    this.id,
    this.l_name,
    this.joining_date,
    this.salary,
    this.address,
    this.religion,
    this.gender,
    this.grade,
    this.subjects,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) =>
      _$TeacherFromJson(json);
  Map<String, dynamic> toJson() => _$TeacherToJson(this);
}

@JsonSerializable()
class FTeacher {
  bool? status;
  String? message;
  List<Teacher>? teacher;

  FTeacher({this.status, this.message, this.teacher});
  factory FTeacher.fromJson(Map<String, dynamic> json) =>
      _$FTeacherFromJson(json);
  Map<String, dynamic> toJson() => _$FTeacherToJson(this);
}
