import 'package:json_annotation/json_annotation.dart';

part 'subject.g.dart';

@JsonSerializable()
class Subject{
  int? id;
  String? name;
  String? created_at;
  String? updated_at;

  Subject({

   this.updated_at,
   this.id,
   this.created_at,
   this.name,
  });

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);
  Map<String, dynamic> toJson() => _$SubjectToJson(this);

}

@JsonSerializable()
class FSubject{
  bool? status;
  String? message;
  List<Subject>? subjects;
  FSubject({
    this.message,
    this.status,
    this.subjects
  });

  factory FSubject.fromJson(Map<String, dynamic> json) =>
      _$FSubjectFromJson(json);
  Map<String, dynamic> toJson() => _$FSubjectToJson(this);

}