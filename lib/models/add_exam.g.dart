// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_exam.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddQuestionToExam _$AddQuestionToExamFromJson(Map<String, dynamic> json) =>
    AddQuestionToExam(
      questionId: json['question_id'] as int? ?? 0,
      mark: json['mark'] as int? ?? 0,
    );

Map<String, dynamic> _$AddQuestionToExamToJson(AddQuestionToExam instance) =>
    <String, dynamic>{
      'question_id': instance.questionId,
      'mark': instance.mark,
    };

AddExam _$AddExamFromJson(Map<String, dynamic> json) => AddExam(
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) => AddQuestionToExam.fromJson(e as Map<String, dynamic>))
          .toList(),
      subjectId: json['subject_id'] as int? ?? 0,
      classId: json['class_id'] as int? ?? 0,
      start: json['start'] == null
          ? null
          : DateTime.parse(json['start'] as String),
      end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
      examNameId: json['exam_name_id'] as int? ?? 0,
      seasonId: json['season_id'] as int? ?? 0,
    );

Map<String, dynamic> _$AddExamToJson(AddExam instance) => <String, dynamic>{
      'class_id': instance.classId,
      'subject_id': instance.subjectId,
      'exam_name_id': instance.examNameId,
      'start': instance.start?.toIso8601String(),
      'end': instance.end?.toIso8601String(),
      'season_id': instance.seasonId,
      'questions': instance.questions,
    };
