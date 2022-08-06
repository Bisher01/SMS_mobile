// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'syllabi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Syllabi _$SyllabiFromJson(Map<String, dynamic> json) => Syllabi(
      id: json['id'] as int?,
      class_id: json['class_id'] as int?,
      subject_id: json['subject_id'] as int?,
      content: json['content'] as String?,
      active: json['active'] as int?,
      subject: json['subject'] == null
          ? null
          : Subject.fromJson(json['subject'] as Map<String, dynamic>),
      classes: json['class'] == null
          ? null
          : Class.fromJson(json['class'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SyllabiToJson(Syllabi instance) => <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'class_id': instance.class_id,
      'subject_id': instance.subject_id,
      'active': instance.active,
      'class': instance.classes,
      'subject': instance.subject,
    };

FSyllabi _$FSyllabiFromJson(Map<String, dynamic> json) => FSyllabi(
      message: json['message'] as String?,
      status: json['status'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Syllabi.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FSyllabiToJson(FSyllabi instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
