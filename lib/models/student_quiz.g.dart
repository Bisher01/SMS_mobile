// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentQuiz _$StudentQuizFromJson(Map<String, dynamic> json) => StudentQuiz(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => QuizData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StudentQuizToJson(StudentQuiz instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

QuizData _$QuizDataFromJson(Map<String, dynamic> json) => QuizData(
      id: json['id'] as int?,
      start: json['start'] == null
          ? null
          : DateTime.parse(json['start'] as String),
      end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
      mark: json['mark'] as int?,
      quizNameId: json['quiz_name_id'] as int?,
      teacherSubjectId: json['teacher_subject_id'] as int?,
      seasonId: json['season_id'] as int?,
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) => Questions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuizDataToJson(QuizData instance) => <String, dynamic>{
      'id': instance.id,
      'start': instance.start?.toIso8601String(),
      'end': instance.end?.toIso8601String(),
      'mark': instance.mark,
      'quiz_name_id': instance.quizNameId,
      'teacher_subject_id': instance.teacherSubjectId,
      'season_id': instance.seasonId,
      'questions': instance.questions,
    };
