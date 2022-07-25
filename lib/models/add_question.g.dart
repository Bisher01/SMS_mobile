// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Choice _$ChoiceFromJson(Map<String, dynamic> json) => Choice(
      status: json['status'] as int?,
      text: json['text'] as String?,
    );

Map<String, dynamic> _$ChoiceToJson(Choice instance) => <String, dynamic>{
      'text': instance.text,
      'status': instance.status,
    };

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      text: json['text'] as String?,
      choices: (json['choices'] as List<dynamic>?)
          ?.map((e) => Choice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'text': instance.text,
      'choices': instance.choices,
    };

AddQuestionModel _$AddQuestionModelFromJson(Map<String, dynamic> json) =>
    AddQuestionModel(
      classId: json['class_id'] as String?,
      question: (json['question'] as List<dynamic>?)
          ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
      subjectId: json['subject_id'] as String?,
      teacherId: json['teacher_id'] as String?,
    );

Map<String, dynamic> _$AddQuestionModelToJson(AddQuestionModel instance) =>
    <String, dynamic>{
      'class_id': instance.classId,
      'teacher_id': instance.teacherId,
      'subject_id': instance.subjectId,
      'question': instance.question,
    };
