// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamSchedule _$ExamScheduleFromJson(Map<String, dynamic> json) => ExamSchedule(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      exams: (json['exams'] as List<dynamic>?)
          ?.map((e) => MiniExamSchedule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExamScheduleToJson(ExamSchedule instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'exams': instance.exams,
    };

MiniExamSchedule _$MiniExamScheduleFromJson(Map<String, dynamic> json) =>
    MiniExamSchedule(
      end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
      id: json['id'] as int? ?? 0,
      mark: json['mark'] as int? ?? 0,
      start: json['start'] == null
          ? null
          : DateTime.parse(json['start'] as String),
      season_id: json['season_id'] as int? ?? 0,
      exam_name_id: json['exam_name_id'] as int? ?? 0,
      subject_mark: json['subject_mark'] == null
          ? null
          : SubjectMark.fromJson(json['subject_mark'] as Map<String, dynamic>),
      subject_mark_id: json['subject_mark_id'] as int? ?? 0,
    );

Map<String, dynamic> _$MiniExamScheduleToJson(MiniExamSchedule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start': instance.start?.toIso8601String(),
      'end': instance.end?.toIso8601String(),
      'mark': instance.mark,
      'exam_name_id': instance.exam_name_id,
      'subject_mark_id': instance.subject_mark_id,
      'season_id': instance.season_id,
      'subject_mark': instance.subject_mark,
    };

SubjectMark _$SubjectMarkFromJson(Map<String, dynamic> json) => SubjectMark(
      id: json['id'] as int? ?? 0,
      mark: json['mark'] as int? ?? 0,
      subject: json['subject'] == null
          ? null
          : Subject.fromJson(json['subject'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubjectMarkToJson(SubjectMark instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mark': instance.mark,
      'subject': instance.subject,
    };
