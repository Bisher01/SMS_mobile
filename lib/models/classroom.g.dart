// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'classroom.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Classroom _$ClassroomFromJson(Map<String, dynamic> json) => Classroom(
      updated_at: json['updated_at'] as String?,
      id: json['id'] as int?,
      created_at: json['created_at'] as String?,
      name: json['name'] as String?,
      max_number: json['max_number'] as String?,
    );

Map<String, dynamic> _$ClassroomToJson(Classroom instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'max_number': instance.max_number,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };

FClassroom _$FClassroomFromJson(Map<String, dynamic> json) => FClassroom(
      message: json['message'] as String?,
      status: json['status'] as bool?,
      classrooms: (json['classrooms'] as List<dynamic>?)
          ?.map((e) => Classroom.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FClassroomToJson(FClassroom instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'classrooms': instance.classrooms,
    };
