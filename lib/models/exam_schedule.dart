import 'package:json_annotation/json_annotation.dart';
import 'package:sms_mobile/models/models.dart';
part 'exam_schedule.g.dart';

@JsonSerializable()
class ExamSchedule {
  bool? status;
  String? message;
  List<MiniExamSchedule>? exams;

  ExamSchedule({
    this.status,
    this.message,
    this.exams,
  });

  factory ExamSchedule.fromJson(Map<String, dynamic> json) =>
      _$ExamScheduleFromJson(json);
  Map<String, dynamic> toJson() => _$ExamScheduleToJson(this);
}

@JsonSerializable()
class MiniExamSchedule {
  @JsonKey(defaultValue: 0)
  int? id;
  DateTime? start;
  DateTime? end;
  @JsonKey(defaultValue: 0)
  int? mark;
  @JsonKey(defaultValue: 0)
  int? exam_name_id;
  @JsonKey(defaultValue: 0)
  int? subject_mark_id;
  @JsonKey(defaultValue: 0)
  int? season_id;
  SubjectMark? subject_mark;

  MiniExamSchedule({
    this.end,
    this.id,
    this.mark,
    this.start,
    this.season_id,
    this.exam_name_id,
    this.subject_mark,
    this.subject_mark_id,
  });

  factory MiniExamSchedule.fromJson(Map<String, dynamic> json) =>
      _$MiniExamScheduleFromJson(json);
  Map<String, dynamic> toJson() => _$MiniExamScheduleToJson(this);
}


@JsonSerializable()
class SubjectMark {
  @JsonKey(defaultValue: 0)
  int? id;
  @JsonKey(defaultValue: 0)
  int? mark;
  Subject? subject;

  SubjectMark({
    this.id,
    this.mark,
    this.subject

  });

  factory SubjectMark.fromJson(Map<String, dynamic> json) =>
      _$SubjectMarkFromJson(json);
  Map<String, dynamic> toJson() => _$SubjectMarkToJson(this);
}
