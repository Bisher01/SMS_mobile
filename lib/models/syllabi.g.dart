// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'syllabi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Syllabi _$SyllabiFromJson(Map<String, dynamic> json) => Syllabi(
      id: json['id'] as int?,
      updated_at: json['updated_at'] as String?,
      created_at: json['created_at'] as String?,
      class_id: json['class_id'] as int?,
      subject_id: json['subject_id'] as int?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$SyllabiToJson(Syllabi instance) => <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'class_id': instance.class_id,
      'subject_id': instance.subject_id,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };

FSyllabi _$FSyllabiFromJson(Map<String, dynamic> json) => FSyllabi(
      message: json['message'] as String?,
      status: json['status'] as bool?,
      syllabi: (json['syllabi'] as List<dynamic>?)
          ?.map((e) => Syllabi.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FSyllabiToJson(FSyllabi instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'syllabi': instance.syllabi,
    };
