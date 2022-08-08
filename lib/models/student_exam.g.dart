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
      examNameId: json['exam_name_id'] as int?,
      subjectMarkId: json['subject_mark_id'] as int?,
      seasonId: json['season_id'] as int?,
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) => Questions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExamDataToJson(ExamData instance) => <String, dynamic>{
      'id': instance.id,
      'start': instance.start?.toIso8601String(),
      'end': instance.end?.toIso8601String(),
      'mark': instance.mark,
      'exam_name_id': instance.examNameId,
      'subject_mark_id': instance.subjectMarkId,
      'season_id': instance.seasonId,
      'questions': instance.questions,
    };

Questions _$QuestionsFromJson(Map<String, dynamic> json) => Questions(
      id: json['id'] as int?,
      text: json['text'] as String?,
      teacherSubjectsId: json['teacher_subjects_id'] as int?,
      choices: (json['choices'] as List<dynamic>?)
          ?.map((e) => Choices.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionsToJson(Questions instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'teacher_subjects_id': instance.teacherSubjectsId,
      'choices': instance.choices,
    };

Choices _$ChoicesFromJson(Map<String, dynamic> json) => Choices(
      id: json['id'] as int?,
      text: json['text'] as String?,
      status: json['status'] as int?,
      questionId: json['question_id'] as int?,
    );

Map<String, dynamic> _$ChoicesToJson(Choices instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'status': instance.status,
      'question_id': instance.questionId,
    };

QuestionsBank _$QuestionsBankFromJson(Map<String, dynamic> json) =>
    QuestionsBank(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) => MiniQuestions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionsBankToJson(QuestionsBank instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'questions': instance.questions,
    };

MiniQuestions _$MiniQuestionsFromJson(Map<String, dynamic> json) =>
    MiniQuestions(
      max_mark: json['max mark'] as int?,
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) => Questions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MiniQuestionsToJson(MiniQuestions instance) =>
    <String, dynamic>{
      'max mark': instance.max_mark,
      'questions': instance.questions,
    };
