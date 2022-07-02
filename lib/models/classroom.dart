import 'package:json_annotation/json_annotation.dart';

part 'classroom.g.dart';

@JsonSerializable()
class Classroom{
  int? id;
  String? name;
  String? max_number;
  String? created_at;
  String? updated_at;

  Classroom({

    this.updated_at,
    this.id,
    this.created_at,
    this.name,
    this.max_number
  });

  factory Classroom.fromJson(Map<String, dynamic> json) =>
      _$ClassroomFromJson(json);
  Map<String, dynamic> toJson() => _$ClassroomToJson(this);

}

@JsonSerializable()
class FClassroom{
  bool? status;
  String? message;
  List<Classroom>? classrooms;
  FClassroom({
    this.message,
    this.status,
    this.classrooms
  });

  factory FClassroom.fromJson(Map<String, dynamic> json) =>
      _$FClassroomFromJson(json);
  Map<String, dynamic> toJson() => _$FClassroomToJson(this);

}