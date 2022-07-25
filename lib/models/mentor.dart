import 'package:json_annotation/json_annotation.dart';
import '../models/models.dart';
part 'mentor.g.dart';

@JsonSerializable()
class Mentor {
  int? id;
  String? f_name;
  String? l_name;
  String? email;
  String? code;
  String? joining_date;
  String? phone;
  int? class_id;
  int? address_id;
  @JsonKey(name: 'class')
  Class? classes;
  Address? address;

  Mentor({
    this.address_id,
    this.code,
    this.email,
    this.f_name,
    this.id,
    this.l_name,
    this.joining_date,
    this.class_id,
    this.phone,
    this.address,
    this.classes,
  });

  factory Mentor.fromJson(Map<String, dynamic> json) => _$MentorFromJson(json);
  Map<String, dynamic> toJson() => _$MentorToJson(this);
}

@JsonSerializable()
class FMentor {
  bool? status;
  String? message;
  List<Mentor>? mentor;
  FMentor({this.message, this.status, this.mentor});

  factory FMentor.fromJson(Map<String, dynamic> json) =>
      _$FMentorFromJson(json);
  Map<String, dynamic> toJson() => _$FMentorToJson(this);
}
