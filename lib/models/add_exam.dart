import 'package:json_annotation/json_annotation.dart';

part 'add_exam.g.dart';

@JsonSerializable()
class AddQuestionToExam {
  @JsonKey(name: 'question_id',defaultValue: 0)
  int? questionId;
  @JsonKey(defaultValue: 0)
  int? mark;

  AddQuestionToExam({this.questionId, this.mark});

  factory AddQuestionToExam.fromJson(Map<String, dynamic> json) =>
      _$AddQuestionToExamFromJson(json);
  Map<String, dynamic> toJson() => _$AddQuestionToExamToJson(this);
}

@JsonSerializable()
class AddExam {
  @JsonKey(name: 'class_id',defaultValue: 0)
  int? classId;
  @JsonKey(name: 'subject_id',defaultValue: 0)
  int? subjectId;
  @JsonKey(name: 'exam_name_id',defaultValue: 0)
  int? examNameId;
  DateTime? start;
  DateTime? end;
  @JsonKey(name: 'season_id',defaultValue: 0)
  int? seasonId;
  List<AddQuestionToExam>? questions;

  AddExam({
    this.questions,
    this.subjectId,
    this.classId,
    this.start,
    this.end,
    this.examNameId,
    this.seasonId,
  });

  factory AddExam.fromJson(Map<String, dynamic> json) =>
      _$AddExamFromJson(json);
  Map<String, dynamic> toJson() => _$AddExamToJson(this);
}
