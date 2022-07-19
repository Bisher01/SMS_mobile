import 'package:json_annotation/json_annotation.dart';

part 'classroom.g.dart';

@JsonSerializable()
class Classroom {
  int? id;
  String? name;
  int? max_number;

  Classroom({this.id, this.name, this.max_number});

  factory Classroom.fromJson(Map<String, dynamic> json) =>
      _$ClassroomFromJson(json);
  Map<String, dynamic> toJson() => _$ClassroomToJson(this);
}

@JsonSerializable()
class FClassroom {
  bool? status;
  String? message;
  List<Classroom>? classrooms;
  FClassroom({this.message, this.status, this.classrooms});

  factory FClassroom.fromJson(Map<String, dynamic> json) =>
      _$FClassroomFromJson(json);
  Map<String, dynamic> toJson() => _$FClassroomToJson(this);
}
