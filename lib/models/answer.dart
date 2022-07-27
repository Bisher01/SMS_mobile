import 'package:json_annotation/json_annotation.dart';

part 'answer.g.dart';

@JsonSerializable()
class Answers{
  @JsonKey(name: 'question_id')
  int? questionId;
  @JsonKey(name: 'choice_id')
  int? choiceId;
  Answers({this.questionId,this.choiceId});

  factory Answers.fromJson(Map<String,dynamic> json) => _$AnswersFromJson(json);
  Map<String,dynamic> toJson() => _$AnswersToJson(this);
}