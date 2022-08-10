import 'package:json_annotation/json_annotation.dart';
import 'package:sms_mobile/models/models.dart';

part 'attendance_model.g.dart';

@JsonSerializable()
class AttendanceModel{
  @JsonKey(defaultValue: '')
  String? date;
  List<StudentAttendance>? students;
  AttendanceModel({
    this.date,
    this.students,
});

  factory AttendanceModel.fromJson(Map<String,dynamic> json) => _$AttendanceModelFromJson(json);
  Map<String,dynamic> toJson() => _$AttendanceModelToJson(this);
}

@JsonSerializable()
class StudentAttendance{
  @JsonKey(name: 'student_id',defaultValue: 0)
  int? id;
  @JsonKey(name: 'status_id',defaultValue: 0)
  int? status;

  StudentAttendance({
    this.id,
    this.status,
});

  factory StudentAttendance.fromJson(Map<String,dynamic> json) => _$StudentAttendanceFromJson(json);
  Map<String,dynamic> toJson() => _$StudentAttendanceToJson(this);
}

@JsonSerializable()
class MentorClasses{
bool? status;
String? message;
@JsonKey(name: 'data')
List<MentorClassesData>? mentorData;

MentorClasses({this.status,this.message,this.mentorData});

factory MentorClasses.fromJson(Map<String,dynamic> json) => _$MentorClassesFromJson(json);
Map<String,dynamic> toJson() => _$MentorClassesToJson(this);


}

@JsonSerializable()
class MentorClassesData{
  int? id;
  @JsonKey(name: 'class_id',defaultValue: 0)
  int? classId;
  @JsonKey(name: 'classroom_id',defaultValue: 0)
  int? classRoomId;
  Classroom? classrooms;
  List<Student>? students;

  MentorClassesData({this.id,this.classId,this.classRoomId,this.classrooms,this.students});

  factory MentorClassesData.fromJson(Map<String,dynamic> json) => _$MentorClassesDataFromJson(json);
  Map<String,dynamic> toJson() => _$MentorClassesDataToJson(this);
}

