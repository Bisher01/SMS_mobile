import 'package:json_annotation/json_annotation.dart';

part 'exam_answers.g.dart';

@JsonSerializable()
class Answer {
  String? id;
  @JsonKey(name: 'choise')
  String? choice;
  Answer({this.id, this.choice});
  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
  Map<String, dynamic> toJson() => _$AnswerToJson(this);
}

@JsonSerializable()
class QuestionsAnswers {
  @JsonKey(name: 'question')
  List<Answer>? answers;
  QuestionsAnswers({this.answers});
  factory QuestionsAnswers.fromJson(Map<String, dynamic> json) =>
      _$QuestionsAnswersFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionsAnswersToJson(this);
}
