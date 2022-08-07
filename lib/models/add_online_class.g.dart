// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_online_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddOnlineClass _$AddOnlineClassFromJson(Map<String, dynamic> json) =>
    AddOnlineClass(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      link: json['link'] as String?,
      id: json['id'] as int?,
      teacher_subject_id: json['teacher_subject_id'] as int?,
    );

Map<String, dynamic> _$AddOnlineClassToJson(AddOnlineClass instance) =>
    <String, dynamic>{
      'link': instance.link,
      'date': instance.date?.toIso8601String(),
      'teacher_subject_id': instance.teacher_subject_id,
      'id': instance.id,
    };

FAddOnlineClass _$FAddOnlineClassFromJson(Map<String, dynamic> json) =>
    FAddOnlineClass(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AddOnlineClass.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      status: json['status'] as bool?,
    );

Map<String, dynamic> _$FAddOnlineClassToJson(FAddOnlineClass instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
