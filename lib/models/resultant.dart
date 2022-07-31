import 'package:json_annotation/json_annotation.dart';

part 'resultant.g.dart';

@JsonSerializable()
class Resultant {
  String? subjectName;
  double? subjectMark;
  double? quize;
  double? exam;
  double? test;
  double? oralTest;
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
