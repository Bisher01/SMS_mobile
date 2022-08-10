import 'package:json_annotation/json_annotation.dart';

part 'resultant.g.dart';

@JsonSerializable()
class Resultant {
  @JsonKey(defaultValue: '')
  String? subjectName;
  @JsonKey(defaultValue: 0)
  double? subjectMark;
  @JsonKey(defaultValue: 0)
  double? quize;
  @JsonKey(defaultValue: 0)
  double? exam;
  @JsonKey(defaultValue: 0)
  double? test;
  @JsonKey(defaultValue: 0)
  double? oralTest;
  @JsonKey(defaultValue: 0)
  double? totalMark;



  Resultant({
   this.exam,
    this.oralTest,
    this.quize,
    this.subjectMark,
    this.subjectName,
    this.test,
    this.totalMark,
  });

  factory Resultant.fromJson(Map<String, dynamic> json) => _$ResultantFromJson(json);
  Map<String, dynamic> toJson() => _$ResultantToJson(this);
}

@JsonSerializable()
class FResultant {
  bool? status;
  String? message;
  List<Resultant>? resultant;
  FResultant({this.message, this.status, this.resultant});

  factory FResultant.fromJson(Map<String, dynamic> json) =>
      _$FResultantFromJson(json);
  Map<String, dynamic> toJson() => _$FResultantToJson(this);
}
