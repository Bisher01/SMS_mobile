// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_answers.dart';

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

QuestionsAnswers _$QuestionsAnswersFromJson(Map<String, dynamic> json) =>
    QuestionsAnswers(
      answers: (json['questions'] as List<dynamic>?)
          ?.map((e) => Answer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionsAnswersToJson(QuestionsAnswers instance) =>
    <String, dynamic>{
      'questions': instance.answers,
    };
