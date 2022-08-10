import 'package:json_annotation/json_annotation.dart';

part 'add_question.g.dart';

@JsonSerializable()
class Choice{
  @JsonKey(defaultValue: '')
  String? text;
  @JsonKey(defaultValue: 0)
  int? status;
  Choice({this.status,this.text});
  factory Choice.fromJson(Map<String,dynamic>json) => _$ChoiceFromJson(json);
  Map<String,dynamic> toJson() => _$ChoiceToJson(this);
}

@JsonSerializable()
class Question{
  @JsonKey(defaultValue: '')
  String? text;
  List<Choice> chioces;
  @JsonKey(name: '_method')
  String? method;
  Question({this.text,required this.chioces,this.method});
  factory Question.fromJson(Map<String,dynamic>json ) => _$QuestionFromJson(json);
  Map<String,dynamic> toJson() => _$QuestionToJson(this);
}

@JsonSerializable()
class AddQuestionModel{
  @JsonKey(name: 'class_id',defaultValue: '')
  String? classId;
  @JsonKey(name: 'teacher_id',defaultValue: '')
  String? teacherId;
  @JsonKey(name: 'subject_id',defaultValue: '')
  String? subjectId;
  List<Question> question;
  AddQuestionModel({this.classId,required this.question,this.subjectId,this.teacherId});
  factory AddQuestionModel.fromJson(Map<String,dynamic>json ) => _$AddQuestionModelFromJson(json);
  Map<String,dynamic> toJson() => _$AddQuestionModelToJson(this);
}