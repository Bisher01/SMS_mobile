// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddQuestionToQuiz _$AddQuestionToQuizFromJson(Map<String, dynamic> json) =>
    AddQuestionToQuiz(
      questionId: json['question_id'] as int?,
      mark: json['mark'] as int?,
    );

Map<String, dynamic> _$AddQuestionToQuizToJson(AddQuestionToQuiz instance) =>
    <String, dynamic>{
      'question_id': instance.questionId,
      'mark': instance.mark,
    };

AddQuiz _$AddQuizFromJson(Map<String, dynamic> json) => AddQuiz(
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) => AddQuestionToQuiz.fromJson(e as Map<String, dynamic>))
          .toList(),
      subjectId: json['subject_id'] as int?,
      classId: json['class_id'] as int?,
      start: json['start'] == null
          ? null
          : DateTime.parse(json['start'] as String),
      end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
      seasonId: json['season_id'] as int?,
      classroomId: json['classroom_id'] as int?,
      teacherId: json['teacher_id'] as int?,
    );

Map<String, dynamic> _$AddQuizToJson(AddQuiz instance) => <String, dynamic>{
      'teacher_id': instance.teacherId,
      'class_id': instance.classId,
      'classroom_id': instance.classroomId,
      'subject_id': instance.subjectId,
      'start': instance.start?.toIso8601String(),
      'end': instance.end?.toIso8601String(),
      'season_id': instance.seasonId,
      'questions': instance.questions,
    };
