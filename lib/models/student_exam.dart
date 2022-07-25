import 'package:json_annotation/json_annotation.dart';
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
  int? examNameId;
  int? subjectMarkId;
  int? seasonId;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Questions>? questions;

  ExamData({
    this.id,
    this.start,
    this.end,
    this.mark,
    this.examNameId,
    this.subjectMarkId,
    this.seasonId,
    this.createdAt,
    this.updatedAt,
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
  int? teacherSubjectsId;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Choices>? choices;

  Questions({
    this.id,
    this.text,
    this.teacherSubjectsId,
    this.createdAt,
    this.updatedAt,
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
  int? questionId;
  DateTime? createdAt;
  DateTime? updatedAt;

  Choices({
    this.id,
    this.text,
    this.status,
    this.questionId,
    this.createdAt,
    this.updatedAt,
  });

  factory Choices.fromJson(Map<String, dynamic> json) => _$ChoicesFromJson(json);
  Map<String, dynamic> toJson() => _$ChoicesToJson(this);
}
