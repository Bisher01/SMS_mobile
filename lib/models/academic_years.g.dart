// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'academic_years.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcademicYears _$AcademicYearsFromJson(Map<String, dynamic> json) =>
    AcademicYears(
      updated_at: json['updated_at'] as String?,
      id: json['id'] as int?,
      created_at: json['created_at'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$AcademicYearsToJson(AcademicYears instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };

FAcademicYears _$FAcademicYearsFromJson(Map<String, dynamic> json) =>
    FAcademicYears(
      message: json['message'] as String?,
      status: json['status'] as bool?,
      academicYears: (json['Academic Year'] as List<dynamic>?)
          ?.map((e) => AcademicYears.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FAcademicYearsToJson(FAcademicYears instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'Academic Year': instance.academicYears,
    };
