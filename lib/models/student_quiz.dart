import 'package:json_annotation/json_annotation.dart';

import 'models.dart';
part 'student_quiz.g.dart';

@JsonSerializable()
class StudentQuiz {

  bool? status;
  String? message;
  List<QuizData>? data;

  StudentQuiz({
    this.status,
    this.message,
    this.data,
  });

  factory StudentQuiz.fromJson(Map<String, dynamic> json) =>
      _$StudentQuizFromJson(json);
  Map<String, dynamic> toJson() => _$StudentQuizToJson(this);

}

@JsonSerializable()
class QuizData {

  int? id;
  DateTime? start;
  DateTime? end;
  int? mark;
  @JsonKey(name: 'quiz_name_id')
  int? quizNameId;
  @JsonKey(name: 'teacher_subject_id')
  int? teacherSubjectId;
  @JsonKey(name: 'season_id')
  int? seasonId;
  List<Questions>? questions;

  QuizData({
    this.id,
    this.start,
    this.end,
    this.mark,
    this.quizNameId,
    this.teacherSubjectId,
    this.seasonId,
    this.questions,
  });

  factory QuizData.fromJson(Map<String, dynamic> json) =>
      _$QuizDataFromJson(json);
  Map<String, dynamic> toJson() => _$QuizDataToJson(this);
}
