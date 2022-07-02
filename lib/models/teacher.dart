import 'package:json_annotation/json_annotation.dart';

part 'teacher.g.dart';

@JsonSerializable()
class Teacher {
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
  String? created_at;
  String? updated_at;

  Teacher(
      {this.picture,
      this.address_id,
      this.religion_id,
      this.code,
      this.created_at,
      this.email,
      this.f_name,
      this.gender_id,
      this.grade_id,
      this.id,
      this.l_name,
      this.updated_at,
      this.joining_date,
      this.salary,});

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
