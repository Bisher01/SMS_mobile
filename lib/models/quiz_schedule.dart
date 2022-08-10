import 'package:json_annotation/json_annotation.dart';
import 'package:sms_mobile/models/models.dart';
part 'quiz_schedule.g.dart';

@JsonSerializable()
class QuizSchedule {
  bool? status;
  String? message;
  List<MiniQuizSchedule>? quizzes;

  QuizSchedule({
    this.status,
    this.message,
    this.quizzes,
  });

  factory QuizSchedule.fromJson(Map<String, dynamic> json) =>
      _$QuizScheduleFromJson(json);
  Map<String, dynamic> toJson() => _$QuizScheduleToJson(this);
}

@JsonSerializable()
class MiniQuizSchedule {
  @JsonKey(defaultValue: 0)
  int? id;
  DateTime? start;
  DateTime? end;
  @JsonKey(defaultValue: 0)
  int? mark;
  @JsonKey(defaultValue: 0)
  int? quiz_name_id;
  @JsonKey(defaultValue: 0)
  int? teacher_subject_id;
  @JsonKey(defaultValue: 0)
  int? season_id;
  TeacherSubject? teacher_and_subject;

  MiniQuizSchedule({
    this.end,
    this.id,
    this.mark,
    this.start,
    this.season_id,
    this.quiz_name_id,
    this.teacher_and_subject,
    this.teacher_subject_id,
  });

  factory MiniQuizSchedule.fromJson(Map<String, dynamic> json) =>
      _$MiniQuizScheduleFromJson(json);
  Map<String, dynamic> toJson() => _$MiniQuizScheduleToJson(this);
}


@JsonSerializable()
class TeacherSubject {
  @JsonKey(defaultValue: 0)
  int? id;
  @JsonKey(defaultValue: 0)
  int? subject_id;
  @JsonKey(defaultValue: 0)
  int? teacher_id;
  @JsonKey(defaultValue: 0)
  int? class_classroom_id;
  Subject? subjects;

  TeacherSubject({
    this.id,
    this.subject_id,
    this.subjects,
    this.class_classroom_id,
    this.teacher_id,

  });

  factory TeacherSubject.fromJson(Map<String, dynamic> json) =>
      _$TeacherSubjectFromJson(json);
  Map<String, dynamic> toJson() => _$TeacherSubjectToJson(this);
}
