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
  @JsonKey(defaultValue: 0)
  int? id;
  @JsonKey(name: 'student_id',defaultValue: 0)
  int? studentId;
  @JsonKey(name: 'status_id',defaultValue: 0)
  int? statusId;
  @JsonKey(name: 'attendance_id',defaultValue: 0)
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
  @JsonKey(defaultValue: 0)
  int? id;
  @JsonKey(defaultValue: '')
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
  @JsonKey(defaultValue: 0)
  int? id;
  @JsonKey(defaultValue: '')
  String? date;
  AttendanceInfo({
    this.id,
    this.date,
  });
  factory AttendanceInfo.fromJson(Map<String, dynamic> json) => _$AttendanceInfoFromJson(json);
  Map<String, dynamic> toJson() => _$AttendanceInfoToJson(this);
}
