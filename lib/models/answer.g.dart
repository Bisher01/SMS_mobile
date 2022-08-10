// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Answers _$AnswersFromJson(Map<String, dynamic> json) => Answers(
      questionId: json['question_id'] as int? ?? 0,
      choiceId: json['choice_id'] as int? ?? 0,
    );

Map<String, dynamic> _$AnswersToJson(Answers instance) => <String, dynamic>{
      'question_id': instance.questionId,
      'choice_id': instance.choiceId,
    };
