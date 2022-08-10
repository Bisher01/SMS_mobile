import 'package:json_annotation/json_annotation.dart';

part 'edit_question.g.dart';

@JsonSerializable()
class EditQuestionChoices {
  @JsonKey(defaultValue: 0)
  int? id;
  @JsonKey(defaultValue: '')
  String? text;
  @JsonKey(defaultValue: 0)
  int? status;
  EditQuestionChoices({this.id, this.status, this.text});
  factory EditQuestionChoices.fromJson(Map<String, dynamic> json) =>
      _$EditQuestionChoicesFromJson(json);
  Map<String, dynamic> toJson() => _$EditQuestionChoicesToJson(this);
}

@JsonSerializable()
class EditQuestionModel {
  @JsonKey(defaultValue: '')
  String? text;
  List<EditQuestionChoices> choices;
  @JsonKey(name: '_method')
  String? method;
  EditQuestionModel({this.text, required this.choices, this.method});
  factory EditQuestionModel.fromJson(Map<String, dynamic> json) =>
      _$EditQuestionModelFromJson(json);
  Map<String, dynamic> toJson() => _$EditQuestionModelToJson(this);
}
