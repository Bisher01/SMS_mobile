// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectClass _$SubjectClassFromJson(Map<String, dynamic> json) => SubjectClass(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => TeacherData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubjectClassToJson(SubjectClass instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

TeacherData _$TeacherDataFromJson(Map<String, dynamic> json) => TeacherData(
      class_classroom: (json['class_classroom'] as List<dynamic>?)
          ?.map((e) => ClassClassroom.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$TeacherDataToJson(TeacherData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'class_classroom': instance.class_classroom,
    };

ClassClassroom _$ClassClassroomFromJson(Map<String, dynamic> json) =>
    ClassClassroom(
      id: json['id'] as int? ?? 0,
      classes: json['classes'] == null
          ? null
          : Classes.fromJson(json['classes'] as Map<String, dynamic>),
      class_id: json['class_id'] as int? ?? 0,
      classroom_id: json['classroom_id'] as int? ?? 0,
      classrooms: json['classrooms'] == null
          ? null
          : Classroom.fromJson(json['classrooms'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ClassClassroomToJson(ClassClassroom instance) =>
    <String, dynamic>{
      'id': instance.id,
      'class_id': instance.class_id,
      'classroom_id': instance.classroom_id,
      'classes': instance.classes,
      'classrooms': instance.classrooms,
    };
