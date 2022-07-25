// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Answers _$AnswerFromJson(Map<String, dynamic> json) => Answers(
      questionId: json['question_id'] as int?,
      choiceId: json['choice_id'] as int?,
    );

Map<String, dynamic> _$AnswerToJson(Answers instance) => <String, dynamic>{
      'question_id': instance.questionId,
      'choice_id': instance.choiceId,
    };
