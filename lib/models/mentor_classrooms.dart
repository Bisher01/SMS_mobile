import 'package:json_annotation/json_annotation.dart';
import 'package:sms_mobile/models/models.dart';
part 'mentor_classrooms.g.dart';

@JsonSerializable()
class MentorClassrooms {
  @JsonKey(defaultValue: 0)
  int? id;
  @JsonKey(name: 'grade_id',defaultValue: 0)
  int? gradeId;
  @JsonKey(defaultValue: '')
  String? name;
  List<Classroom>? classroom;

  MentorClassrooms({
    this.id,
    this.name,
    this.classroom,
    this.gradeId,
  });

  factory MentorClassrooms.fromJson(Map<String, dynamic> json) =>
      _$MentorClassroomsFromJson(json);
  Map<String, dynamic> toJson() => _$MentorClassroomsToJson(this);
}

@JsonSerializable()
class FMentorClassrooms {
  bool? status;
  String? message;
  List<MentorClassrooms>? data;

  FMentorClassrooms({
    this.status,
    this.data,
    this.message,
  });

  factory FMentorClassrooms.fromJson(Map<String, dynamic> json) =>
      _$FMentorClassroomsFromJson(json);
  Map<String, dynamic> toJson() => _$FMentorClassroomsToJson(this);
}
