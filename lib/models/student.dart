import 'package:json_annotation/json_annotation.dart';
import 'models.dart';
part 'student.g.dart';

@JsonSerializable()
class Student {
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
  String? picture;
  @JsonKey(defaultValue: '')
  String? birthdate;
  @JsonKey(defaultValue: 0)
  int? parent_id;
  @JsonKey(defaultValue: 0)
  int? blood_id;
  @JsonKey(defaultValue: 0)
  int? gender_id;
  @JsonKey(defaultValue: 0)
  int? nationality_id;
  @JsonKey(defaultValue: 0)
  int? religion_id;
  @JsonKey(defaultValue: 0)
  int? grade_id;
  @JsonKey(defaultValue: 0)
  int? class_classroom_id;
  @JsonKey(defaultValue: 0)
  int? academic_year_id;
  @JsonKey(defaultValue: 0)
  int? address_id;
  Grade? grade;
  ClassClassroom? class_classroom;
  AcademicYears? academic_year;
  Address? address;
  Parent? parent;
  Blood? blood;
  Religion? religion;
  Gender? gender;
  Nationality? nationality;


  Student({
    this.academic_year_id,
    this.address_id,
    this.birthdate,
    this.blood_id,
    this.code,
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
    this.religion,
    this.nationality,
    this.academic_year,
    this.blood,
    this.gender,
    this.grade,
    this.class_classroom_id,
    this.class_classroom
  });

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
