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
  List<Attendance>? attendances;

  StudentAttendances(
      {this.academic_year_id,
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
      this.attendances});

  factory StudentAttendances.fromJson(Map<String, dynamic> json) =>
      _$StudentAttendancesFromJson(json);
  Map<String, dynamic> toJson() => _$StudentAttendancesToJson(this);
}

@JsonSerializable()
class Attendance {
  int? id;
  @JsonKey(name: 'student_id')
  int? studentId;
  @JsonKey(name: 'status_id')
  int? statusId;
  @JsonKey(name: 'attendance_id')
  int? attendanceId;
  StatusAttendance? status;
  AttendanceInfo? attendance;
  Attendance({
    this.id,
    this.studentId,
    this.statusId,
    this.status,
    this.attendanceId,
    this.attendance,
  });
  factory Attendance.fromJson(Map<String, dynamic> json) =>
      _$AttendanceFromJson(json);
  Map<String, dynamic> toJson() => _$AttendanceToJson(this);
}

@JsonSerializable()
class StatusAttendance {
  int? id;
  String? status;
  StatusAttendance({
    this.id,
    this.status,
  });
  factory StatusAttendance.fromJson(Map<String, dynamic> json) => _$StatusAttendanceFromJson(json);
  Map<String, dynamic> toJson() => _$StatusAttendanceToJson(this);
}

@JsonSerializable()
class AttendanceInfo {
  int? id;
  String? date;
  AttendanceInfo({
    this.id,
    this.date,
  });
  factory AttendanceInfo.fromJson(Map<String, dynamic> json) => _$AttendanceInfoFromJson(json);
  Map<String, dynamic> toJson() => _$AttendanceInfoToJson(this);
}
