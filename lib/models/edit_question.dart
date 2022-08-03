import 'package:json_annotation/json_annotation.dart';

part 'edit_question.g.dart';

@JsonSerializable()
class EditQuestionChoices {
  int? id;
  String? text;
  int? status;
  EditQuestionChoices({this.id, this.status, this.text});
  factory EditQuestionChoices.fromJson(Map<String, dynamic> json) =>
      _$EditQuestionChoicesFromJson(json);
  Map<String, dynamic> toJson() => _$EditQuestionChoicesToJson(this);
}

@JsonSerializable()
class EditQuestionModel {
  String? text;
  List<EditQuestionChoices> choices;
  @JsonKey(name: '_method')
  String? method;
  EditQuestionModel({this.text, required this.choices, this.method});
  factory EditQuestionModel.fromJson(Map<String, dynamic> json) =>
      _$EditQuestionModelFromJson(json);
  Map<String, dynamic> toJson() => _$EditQuestionModelToJson(this);
}
