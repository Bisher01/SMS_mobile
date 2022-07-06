import 'package:json_annotation/json_annotation.dart';

part 'answer.g.dart';

@JsonSerializable()
class Answer{
  @JsonKey(name: 'question_id')
  int? questionId;
  @JsonKey(name: 'choice_id')
  int? choiceId;

  Answer({this.questionId,this.choiceId});

  factory Answer.fromJson(Map<String,dynamic> json) => _$AnswerFromJson(json);
  Map<String,dynamic> toJson() => _$AnswerToJson(this);
}