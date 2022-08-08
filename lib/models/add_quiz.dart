import 'package:json_annotation/json_annotation.dart';

part 'add_quiz.g.dart';

@JsonSerializable()
class AddQuestionToQuiz {
  @JsonKey(name: 'question_id')
  int? questionId;
  int? mark;

  AddQuestionToQuiz({this.questionId, this.mark});

  factory AddQuestionToQuiz.fromJson(Map<String, dynamic> json) =>
      _$AddQuestionToQuizFromJson(json);
  Map<String, dynamic> toJson() => _$AddQuestionToQuizToJson(this);
}

@JsonSerializable()
class AddQuiz {
  @JsonKey(name: 'teacher_id')
  int? teacherId;
  @JsonKey(name: 'class_id')
  int? classId;
  @JsonKey(name: 'classroom_id')
  int? classroomId;
  @JsonKey(name: 'subject_id')
  int? subjectId;
  DateTime? start;
  DateTime? end;
  @JsonKey(name: 'season_id')
  int? seasonId;
  List<AddQuestionToQuiz>? questions;

  AddQuiz({
    this.questions,
    this.subjectId,
    this.classId,
    this.start,
    this.end,
    this.seasonId,
    this.classroomId,
    this.teacherId,
  });

  factory AddQuiz.fromJson(Map<String, dynamic> json) =>
      _$AddQuizFromJson(json);
  Map<String, dynamic> toJson() => _$AddQuizToJson(this);
}
