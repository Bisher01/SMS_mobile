// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_exam.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentExam _$StudentExamFromJson(Map<String, dynamic> json) => StudentExam(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      exams: (json['exams'] as List<dynamic>?)
          ?.map((e) => ExamData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StudentExamToJson(StudentExam instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'exams': instance.exams,
    };

ExamData _$ExamDataFromJson(Map<String, dynamic> json) => ExamData(
      id: json['id'] as int?,
      start: json['start'] == null
          ? null
          : DateTime.parse(json['start'] as String),
      end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
      mark: json['mark'] as int?,
      examNameId: json['examNameId'] as int?,
      subjectMarkId: json['subjectMarkId'] as int?,
      seasonId: json['seasonId'] as int?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) => Questions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExamDataToJson(ExamData instance) => <String, dynamic>{
      'id': instance.id,
      'start': instance.start?.toIso8601String(),
      'end': instance.end?.toIso8601String(),
      'mark': instance.mark,
      'examNameId': instance.examNameId,
      'subjectMarkId': instance.subjectMarkId,
      'seasonId': instance.seasonId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'questions': instance.questions,
    };

Questions _$QuestionsFromJson(Map<String, dynamic> json) => Questions(
      id: json['id'] as int?,
      text: json['text'] as String?,
      teacherSubjectsId: json['teacherSubjectsId'] as int?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      choices: (json['choices'] as List<dynamic>?)
          ?.map((e) => Choices.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionsToJson(Questions instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'teacherSubjectsId': instance.teacherSubjectsId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'choices': instance.choices,
    };

Choices _$ChoicesFromJson(Map<String, dynamic> json) => Choices(
      id: json['id'] as int?,
      text: json['text'] as String?,
      status: json['status'] as int?,
      questionId: json['questionId'] as int?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ChoicesToJson(Choices instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'status': instance.status,
      'questionId': instance.questionId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
