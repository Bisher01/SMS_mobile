import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'student_timetable.g.dart';

@JsonSerializable()
class StudentTimeTable {
  int? id;
  int? lessonDay_id;
  int? classClassroom_id;
  int? teacher_id;
  int? subject_id;
  Lesson? lesson;
  Subject? subject;
  StudentTeacher? teacher;

  StudentTimeTable({
    this.id,
    this.teacher_id,
    this.classClassroom_id,
    this.lesson,
    this.lessonDay_id,
    this.subject,
    this.teacher,
    this.subject_id,
  });

  factory StudentTimeTable.fromJson(Map<String, dynamic> json) =>
      _$StudentTimeTableFromJson(json);
  Map<String, dynamic> toJson() => _$StudentTimeTableToJson(this);
}

@JsonSerializable()
class FStudentTimeTable {
  bool? status;
  String? message;
  List<StudentTimeTable>? studentTimetable;
  FStudentTimeTable({
    this.message,
    this.status,
    this.studentTimetable,
  });

  factory FStudentTimeTable.fromJson(Map<String, dynamic> json) =>
      _$FStudentTimeTableFromJson(json);
  Map<String, dynamic> toJson() => _$FStudentTimeTableToJson(this);
}
