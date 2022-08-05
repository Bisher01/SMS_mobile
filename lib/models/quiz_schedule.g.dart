// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizSchedule _$QuizScheduleFromJson(Map<String, dynamic> json) => QuizSchedule(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      quizzes: (json['quizzes'] as List<dynamic>?)
          ?.map((e) => MiniQuizSchedule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuizScheduleToJson(QuizSchedule instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'quizzes': instance.quizzes,
    };

MiniQuizSchedule _$MiniQuizScheduleFromJson(Map<String, dynamic> json) =>
    MiniQuizSchedule(
      end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
      id: json['id'] as int?,
      mark: json['mark'] as int?,
      start: json['start'] == null
          ? null
          : DateTime.parse(json['start'] as String),
      season_id: json['season_id'] as int?,
      quiz_name_id: json['quiz_name_id'] as int?,
      teacher_and_subject: json['teacher_and_subject'] == null
          ? null
          : TeacherSubject.fromJson(
              json['teacher_and_subject'] as Map<String, dynamic>),
      teacher_subject_id: json['teacher_subject_id'] as int?,
    );

Map<String, dynamic> _$MiniQuizScheduleToJson(MiniQuizSchedule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start': instance.start?.toIso8601String(),
      'end': instance.end?.toIso8601String(),
      'mark': instance.mark,
      'quiz_name_id': instance.quiz_name_id,
      'teacher_subject_id': instance.teacher_subject_id,
      'season_id': instance.season_id,
      'teacher_and_subject': instance.teacher_and_subject,
    };

TeacherSubject _$TeacherSubjectFromJson(Map<String, dynamic> json) =>
    TeacherSubject(
      id: json['id'] as int?,
      subject_id: json['subject_id'] as int?,
      subjects: json['subjects'] == null
          ? null
          : Subject.fromJson(json['subjects'] as Map<String, dynamic>),
      class_classroom_id: json['class_classroom_id'] as int?,
      teacher_id: json['teacher_id'] as int?,
    );

Map<String, dynamic> _$TeacherSubjectToJson(TeacherSubject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subject_id': instance.subject_id,
      'teacher_id': instance.teacher_id,
      'class_classroom_id': instance.class_classroom_id,
      'subjects': instance.subjects,
    };
