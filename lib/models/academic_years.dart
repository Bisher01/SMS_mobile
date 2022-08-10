import 'package:json_annotation/json_annotation.dart';

part 'academic_years.g.dart';

@JsonSerializable()
class AcademicYears {
  @JsonKey(defaultValue: 0)
  int? id;
  @JsonKey(defaultValue: '')
  String? date;

  AcademicYears({this.id, this.date});

  factory AcademicYears.fromJson(Map<String, dynamic> json) =>
      _$AcademicYearsFromJson(json);
  Map<String, dynamic> toJson() => _$AcademicYearsToJson(this);
}

@JsonSerializable()
class FAcademicYears {
  bool? status;
  String? message;
  @JsonKey(name: 'Academic Year')
  List<AcademicYears>? academicYears;
  FAcademicYears({this.message, this.status, this.academicYears});

  factory FAcademicYears.fromJson(Map<String, dynamic> json) =>
      _$FAcademicYearsFromJson(json);
  Map<String, dynamic> toJson() => _$FAcademicYearsToJson(this);
}
