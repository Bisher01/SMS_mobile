// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mentor_classrooms.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MentorClassrooms _$MentorClassroomsFromJson(Map<String, dynamic> json) =>
    MentorClassrooms(
      id: json['id'] as int?,
      name: json['name'] as String?,
      classroom: (json['classroom'] as List<dynamic>?)
          ?.map((e) => Classroom.fromJson(e as Map<String, dynamic>))
          .toList(),
      gradeId: json['grade_id'] as int?,
    );

Map<String, dynamic> _$MentorClassroomsToJson(MentorClassrooms instance) =>
    <String, dynamic>{
      'id': instance.id,
      'grade_id': instance.gradeId,
      'name': instance.name,
      'classroom': instance.classroom,
    };

FMentorClassrooms _$FMentorClassroomsFromJson(Map<String, dynamic> json) =>
    FMentorClassrooms(
      status: json['status'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => MentorClassrooms.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$FMentorClassroomsToJson(FMentorClassrooms instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
