import 'package:json_annotation/json_annotation.dart';

part 'exam_answers.g.dart';

@JsonSerializable()
class Answer {
  @JsonKey(name: 'question_id')
  int? questionId;
  @JsonKey(name: 'choice_id')
  int? choiceId;
  Answer({this.questionId, this.choiceId});
  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
  Map<String, dynamic> toJson() => _$AnswerToJson(this);
}

@JsonSerializable()
class QuestionsAnswers {
  @JsonKey(name: 'questions')
  List<Answer>? answers;
  QuestionsAnswers({this.answers});
  factory QuestionsAnswers.fromJson(Map<String, dynamic> json) =>
      _$QuestionsAnswersFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionsAnswersToJson(this);
}
