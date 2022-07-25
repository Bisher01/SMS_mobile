import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'add_question.g.dart';

@JsonSerializable()
class Choice{
  String? text;
  int? status;
  Choice({this.status,this.text});
  factory Choice.fromJson(Map<String,dynamic>json) => _$ChoiceFromJson(json);
  Map<String,dynamic> toJson() => _$ChoiceToJson(this);
}

@JsonSerializable()
class Question{
  String? text;
  List<Choice> chioces;
  Question({this.text,required this.chioces});
  factory Question.fromJson(Map<String,dynamic>json ) => _$QuestionFromJson(json);
  Map<String,dynamic> toJson() => _$QuestionToJson(this);
}

@JsonSerializable()
class AddQuestionModel{
  @JsonKey(name: 'class_id')
  String? classId;
  @JsonKey(name: 'teacher_id')
  String? teacherId;
  @JsonKey(name: 'subject_id')
  String? subjectId;
  List<Question> question;
  AddQuestionModel({this.classId,required this.question,this.subjectId,this.teacherId});
  factory AddQuestionModel.fromJson(Map<String,dynamic>json ) => _$AddQuestionModelFromJson(json);
  Map<String,dynamic> toJson() => _$AddQuestionModelToJson(this);
}