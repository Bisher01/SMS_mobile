import 'package:json_annotation/json_annotation.dart';

part 'exam.g.dart';

@JsonSerializable()
class Exam {
  int? id;
  String? start;
  String? end;
  int? mark;
  int? exam_name_id;
  int? subject_mark_id;
  int? season_id;
  String? created_at;
  String? updated_at;

  Exam({
    this.id,
    this.updated_at,
    this.created_at,
    this.end,
    this.exam_name_id,
    this.mark,
    this.season_id,
    this.start,
    this.subject_mark_id,
  });

  factory Exam.fromJson(Map<String, dynamic> json) => _$ExamFromJson(json);
  Map<String, dynamic> toJson() => _$ExamToJson(this);
}

@JsonSerializable()
class FExam {
  bool? status;
  String? message;
  List<Exam>? exam;
  FExam({this.message, this.status, this.exam});

  factory FExam.fromJson(Map<String, dynamic> json) =>
      _$FExamFromJson(json);
  Map<String, dynamic> toJson() => _$FExamToJson(this);
}
