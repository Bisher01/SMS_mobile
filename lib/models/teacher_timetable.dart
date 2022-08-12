import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'teacher_timetable.g.dart';

@JsonSerializable()
class TeacherTimeTable {
  @JsonKey(defaultValue: 0)
  int? id;
  @JsonKey(defaultValue: 0)
  int? lessonDay_id;
  @JsonKey(defaultValue: 0)
  int? classClassroom_id;
  @JsonKey(defaultValue: 0)
  int? teacher_id;
  @JsonKey(defaultValue: 0)
  int? subject_id;
  Lesson? lesson;
  Subject? subject;
  ClassClassroom? classroom;

  TeacherTimeTable({
    this.id,
    this.teacher_id,
    this.classClassroom_id,
    this.lesson,
    this.lessonDay_id,
    this.classroom,
    this.subject,
    this.subject_id,
  });

  factory TeacherTimeTable.fromJson(Map<String, dynamic> json) =>
      _$TeacherTimeTableFromJson(json);
  Map<String, dynamic> toJson() => _$TeacherTimeTableToJson(this);
}

@JsonSerializable()
class FTeacherTimeTable {
  bool? status;
  String? message;
  List<TeacherTimeTable>? teacherTimetable;
  FTeacherTimeTable({this.message, this.status, this.teacherTimetable});

  factory FTeacherTimeTable.fromJson(Map<String, dynamic> json) =>
      _$FTeacherTimeTableFromJson(json);
  Map<String, dynamic> toJson() => _$FTeacherTimeTableToJson(this);
}

@JsonSerializable()
class Day {
  @JsonKey(defaultValue: 0)
  int? id;
  @JsonKey(defaultValue: '')
  String? name;

  Day({this.id, this.name});
  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);
  Map<String, dynamic> toJson() => _$DayToJson(this);
}

@JsonSerializable()
class MiniLesson {
  @JsonKey(defaultValue: 0)
  int? id;
  @JsonKey(defaultValue: '')
  String? name;

  MiniLesson({this.id, this.name});
  factory MiniLesson.fromJson(Map<String, dynamic> json) =>
      _$MiniLessonFromJson(json);
  Map<String, dynamic> toJson() => _$MiniLessonToJson(this);
}

@JsonSerializable()
class Lesson {
  @JsonKey(defaultValue: 0)
  int? id;
  @JsonKey(defaultValue: 0)
  int? day_id;
  @JsonKey(defaultValue: 0)
  int? lesson_id;
  MiniLesson? lessons;
  Day? days;
  Lesson({
    this.id,
    this.day_id,
    this.days,
    this.lesson_id,
    this.lessons,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);
  Map<String, dynamic> toJson() => _$LessonToJson(this);
}
