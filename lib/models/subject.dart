import 'package:json_annotation/json_annotation.dart';

part 'subject.g.dart';

@JsonSerializable()
class Subject {
  @JsonKey(defaultValue: 0)
  int? id;
  @JsonKey(defaultValue: '')
  String? name;

  Subject({
    this.id,
    this.name,
  });

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);
  Map<String, dynamic> toJson() => _$SubjectToJson(this);
}

@JsonSerializable()
class FSubject {
  bool? status;
  String? message;
  List<Subject>? subjects;
  FSubject({this.message, this.status, this.subjects});

  factory FSubject.fromJson(Map<String, dynamic> json) =>
      _$FSubjectFromJson(json);
  Map<String, dynamic> toJson() => _$FSubjectToJson(this);
}
