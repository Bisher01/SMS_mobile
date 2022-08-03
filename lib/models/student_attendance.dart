import 'package:json_annotation/json_annotation.dart';
import 'models.dart';
part 'student_attendance.g.dart';


@JsonSerializable()
class FStudentAttendance {
  bool? status;
  String? message;
  List<StudentAttendances>? data;
  FStudentAttendance({this.status, this.message, this.data});
  factory FStudentAttendance.fromJson(Map<String, dynamic> json) =>
      _$FStudentAttendanceFromJson(json);
  Map<String, dynamic> toJson() => _$FStudentAttendanceToJson(this);
}

@JsonSerializable()
class StudentAttendances {
  int? id;
  String? f_name;
  String? l_name;
  String? email;
  String? code;
  @JsonKey(defaultValue: '')
  String? picture;
  String? birthdate;
  int? parent_id;
  int? blood_id;
  int? gender_id;
  int? nationality_id;
  int? religion_id;
  int? grade_id;
  int? class_classroom_id;
  int? academic_year_id;
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
  List<Attendance>? attendance;


  StudentAttendances({
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
    this.class_classroom,
    this.class_classroom_id,
    this.attendance
  });

  factory StudentAttendances.fromJson(Map<String, dynamic> json) =>
      _$StudentAttendancesFromJson(json);
  Map<String, dynamic> toJson() => _$StudentAttendancesToJson(this);
}



@JsonSerializable()
class Attendance{
  int? id;
  @JsonKey(name: 'student_id')
  int? studentId;
  @JsonKey(name: 'status_id')
  int? statusId;
  String? date;
  Attendance({this.id,this.studentId,this.date,this.statusId});
factory Attendance.fromJson(Map<String, dynamic> json) =>
_$AttendanceFromJson(json);
Map<String, dynamic> toJson() => _$AttendanceToJson(this);
}
