// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_online_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeacherOnlineClass _$TeacherOnlineClassFromJson(Map<String, dynamic> json) =>
    TeacherOnlineClass(
      id: json['id'] as int?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      teacher_subject_id: json['teacher_subject_id'] as int?,
      link: json['link'] as String?,
      teacher_subject: json['teacher_subject'] == null
          ? null
          : TeacherSubjects.fromJson(
              json['teacher_subject'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TeacherOnlineClassToJson(TeacherOnlineClass instance) =>
    <String, dynamic>{
      'id': instance.id,
      'link': instance.link,
      'date': instance.date?.toIso8601String(),
      'teacher_subject_id': instance.teacher_subject_id,
      'teacher_subject': instance.teacher_subject,
    };

FTeacherOnlineClass _$FTeacherOnlineClassFromJson(Map<String, dynamic> json) =>
    FTeacherOnlineClass(
      message: json['message'] as String?,
      status: json['status'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => TeacherOnlineClass.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FTeacherOnlineClassToJson(
        FTeacherOnlineClass instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

TeacherSubjects _$TeacherSubjectsFromJson(Map<String, dynamic> json) =>
    TeacherSubjects(
      id: json['id'] as int?,
      subject_id: json['subject_id'] as int?,
      subjects: json['subjects'] == null
          ? null
          : Subject.fromJson(json['subjects'] as Map<String, dynamic>),
      class_classroom_id: json['class_classroom_id'] as int?,
      teacher_id: json['teacher_id'] as int?,
      class_classrooms: json['class_classrooms'] == null
          ? null
          : ClassClassroom.fromJson(
              json['class_classrooms'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TeacherSubjectsToJson(TeacherSubjects instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subject_id': instance.subject_id,
      'teacher_id': instance.teacher_id,
      'class_classroom_id': instance.class_classroom_id,
      'subjects': instance.subjects,
      'class_classrooms': instance.class_classrooms,
    };
