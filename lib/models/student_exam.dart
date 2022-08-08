import 'package:json_annotation/json_annotation.dart';
import 'package:sms_mobile/models/models.dart';
part 'student_exam.g.dart';

@JsonSerializable()
class StudentExam {

  bool? status;
  String? message;
  List<ExamData>? exams;

  StudentExam({
    this.status,
    this.message,
    this.exams,
  });

  factory StudentExam.fromJson(Map<String, dynamic> json) =>
      _$StudentExamFromJson(json);
  Map<String, dynamic> toJson() => _$StudentExamToJson(this);

}

@JsonSerializable()
class ExamData {

  int? id;
  DateTime? start;
  DateTime? end;
  int? mark;
  @JsonKey(name: 'exam_name_id')
  int? examNameId;
  @JsonKey(name: 'subject_mark_id')
  int? subjectMarkId;
  @JsonKey(name: 'season_id')
  int? seasonId;
  List<Questions>? questions;

  ExamData({
    this.id,
    this.start,
    this.end,
    this.mark,
    this.examNameId,
    this.subjectMarkId,
    this.seasonId,
    this.questions,
  });

  factory ExamData.fromJson(Map<String, dynamic> json) =>
      _$ExamDataFromJson(json);
  Map<String, dynamic> toJson() => _$ExamDataToJson(this);
}

@JsonSerializable()
class Questions {

  int? id;
  String? text;
  @JsonKey(name: 'teacher_subjects_id')
  int? teacherSubjectsId;
  List<Choices>? choices;

  Questions({
    this.id,
    this.text,
    this.teacherSubjectsId,
    this.choices,
  });

  factory Questions.fromJson(Map<String, dynamic> json) =>
      _$QuestionsFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionsToJson(this);
}

@JsonSerializable()
class Choices {

  int? id;
  String? text;
  int? status;
  @JsonKey(name: 'question_id')
  int? questionId;

  Choices({
    this.id,
    this.text,
    this.status,
    this.questionId,
  });

  factory Choices.fromJson(Map<String, dynamic> json) => _$ChoicesFromJson(json);
  Map<String, dynamic> toJson() => _$ChoicesToJson(this);
}


@JsonSerializable()
class QuestionsBank{
  bool? status;
  String? message;
  List<MiniQuestions>? questions;
  QuestionsBank({this.status,this.message,this.questions});
  factory QuestionsBank.fromJson(Map<String, dynamic> json) => _$QuestionsBankFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionsBankToJson(this);

}

@JsonSerializable()
class MiniQuestions{
  @JsonKey(name: 'max mark')
  int? max_mark;
  List<Questions>? questions;
  MiniQuestions({this.max_mark,this.questions});
  factory MiniQuestions.fromJson(Map<String, dynamic> json) => _$MiniQuestionsFromJson(json);
  Map<String, dynamic> toJson() => _$MiniQuestionsToJson(this);

}