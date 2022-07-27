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
      subjects: (json['subjects'] as List<dynamic>?)
          ?.map((e) => Subjects.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as int?,
      picture: json['picture'] as String? ?? '',
      code: json['code'] as String?,
      email: json['email'] as String?,
      grade_id: json['grade_id'] as int?,
      religion_id: json['religion_id'] as int?,
      gender_id: json['gender_id'] as int?,
      address_id: json['address_id'] as int?,
      salary: json['salary'] as String?,
      joining_date: json['joining_date'] as String?,
      l_name: json['l_name'] as String?,
      f_name: json['f_name'] as String?,
    );

Map<String, dynamic> _$TeacherDataToJson(TeacherData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'f_name': instance.f_name,
      'l_name': instance.l_name,
      'email': instance.email,
      'code': instance.code,
      'joining_date': instance.joining_date,
      'picture': instance.picture,
      'salary': instance.salary,
      'address_id': instance.address_id,
      'religion_id': instance.religion_id,
      'gender_id': instance.gender_id,
      'grade_id': instance.grade_id,
      'subjects': instance.subjects,
    };

Subjects _$SubjectsFromJson(Map<String, dynamic> json) => Subjects(
      id: json['id'] as int?,
      name: json['name'] as String?,
      class_classroom: (json['class_classroom'] as List<dynamic>?)
          ?.map((e) => ClassClassroom.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubjectsToJson(Subjects instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'class_classroom': instance.class_classroom,
    };

ClassClassroom _$ClassClassroomFromJson(Map<String, dynamic> json) =>
    ClassClassroom(
      id: json['id'] as int?,
      classes: json['classes'] == null
          ? null
          : Classes.fromJson(json['classes'] as Map<String, dynamic>),
      class_id: json['class_id'] as int?,
      classroom_id: json['classroom_id'] as int?,
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
