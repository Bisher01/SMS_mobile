import 'package:json_annotation/json_annotation.dart';
import 'models.dart';
part 'student.g.dart';

@JsonSerializable()
class Student {
  int? id;
  String? f_name;
  String? l_name;
  String? email;
  String? code;
  @JsonKey(defaultValue: '')
  String? picture;
  String? birthdate;
  int? nationality_id;
  int? parent_id;
  int? blood_id;
  int? gender_id;
  int? religion_id;
  int? grade_id;
  int? class_id;
  int? classroom_id;
  int? academic_year_id;
  int? address_id;
  String? deleted_at;
  Parent? parent;
  Address? address;
  String? created_at;
  String? updated_at;

  Student(
      {this.academic_year_id,
      this.address_id,
      this.birthdate,
      this.blood_id,
      this.class_id,
      this.classroom_id,
      this.code,
      this.created_at,
      this.deleted_at,
      this.email,
      this.f_name,
      this.gender_id,
      this.grade_id,
      this.id,
      this.l_name,
      this.nationality_id,
      this.parent_id,
      this.picture,
      this.parent,
      this.address,
      this.religion_id,
      this.updated_at});

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);
  Map<String, dynamic> toJson() => _$StudentToJson(this);
}

@JsonSerializable()
class FStudent {
  bool? status;
  String? message;
  List<Student>? student;
  FStudent({this.status, this.message, this.student});
  factory FStudent.fromJson(Map<String, dynamic> json) =>
      _$FStudentFromJson(json);
  Map<String, dynamic> toJson() => _$FStudentToJson(this);
}
