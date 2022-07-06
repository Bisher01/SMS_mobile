// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Answer _$AnswerFromJson(Map<String, dynamic> json) => Answer(
      questionId: json['question_id'] as int?,
      choiceId: json['choice_id'] as int?,
    );

Map<String, dynamic> _$AnswerToJson(Answer instance) => <String, dynamic>{
      'question_id': instance.questionId,
      'choice_id': instance.choiceId,
    };
