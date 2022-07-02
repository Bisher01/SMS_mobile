// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Subject _$SubjectFromJson(Map<String, dynamic> json) => Subject(
      updated_at: json['updated_at'] as String?,
      id: json['id'] as int?,
      created_at: json['created_at'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$SubjectToJson(Subject instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };

FSubject _$FSubjectFromJson(Map<String, dynamic> json) => FSubject(
      message: json['message'] as String?,
      status: json['status'] as bool?,
      subjects: (json['subjects'] as List<dynamic>?)
          ?.map((e) => Subject.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FSubjectToJson(FSubject instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'subjects': instance.subjects,
    };
