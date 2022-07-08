// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exam _$ExamFromJson(Map<String, dynamic> json) => Exam(
      id: json['id'] as int?,
      updated_at: json['updated_at'] as String?,
      created_at: json['created_at'] as String?,
      end: json['end'] as String?,
      exam_name_id: json['exam_name_id'] as int?,
      mark: json['mark'] as int?,
      season_id: json['season_id'] as int?,
      start: json['start'] as String?,
      subject_mark_id: json['subject_mark_id'] as int?,
    );

Map<String, dynamic> _$ExamToJson(Exam instance) => <String, dynamic>{
      'id': instance.id,
      'start': instance.start,
      'end': instance.end,
      'mark': instance.mark,
      'exam_name_id': instance.exam_name_id,
      'subject_mark_id': instance.subject_mark_id,
      'season_id': instance.season_id,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };

FExam _$FExamFromJson(Map<String, dynamic> json) => FExam(
      message: json['message'] as String?,
      status: json['status'] as bool?,
      exam: (json['exam'] as List<dynamic>?)
          ?.map((e) => Exam.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FExamToJson(FExam instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'exam': instance.exam,
    };
