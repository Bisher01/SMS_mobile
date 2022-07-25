// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_answers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Answer _$AnswerFromJson(Map<String, dynamic> json) => Answer(
      id: json['id'] as String?,
      choice: json['choise'] as String?,
    );

Map<String, dynamic> _$AnswerToJson(Answer instance) => <String, dynamic>{
      'id': instance.id,
      'choise': instance.choice,
    };

QuestionsAnswers _$QuestionsAnswersFromJson(Map<String, dynamic> json) =>
    QuestionsAnswers(
      answers: (json['question'] as List<dynamic>?)
          ?.map((e) => Answer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionsAnswersToJson(QuestionsAnswers instance) =>
    <String, dynamic>{
      'question': instance.answers,
    };
