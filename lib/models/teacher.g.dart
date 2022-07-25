// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Teacher _$TeacherFromJson(Map<String, dynamic> json) => Teacher(
      picture: json['picture'] as String? ?? '',
      address_id: json['address_id'] as int?,
      religion_id: json['religion_id'] as int?,
      code: json['code'] as String?,
      email: json['email'] as String?,
      f_name: json['f_name'] as String?,
      gender_id: json['gender_id'] as int?,
      grade_id: json['grade_id'] as int?,
      id: json['id'] as int?,
      l_name: json['l_name'] as String?,
      joining_date: json['joining_date'] as String?,
      salary: json['salary'] as String?,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      religion: json['religion'] == null
          ? null
          : Religion.fromJson(json['religion'] as Map<String, dynamic>),
      gender: json['gender'] == null
          ? null
          : Gender.fromJson(json['gender'] as Map<String, dynamic>),
      grade: json['grade'] == null
          ? null
          : Grade.fromJson(json['grade'] as Map<String, dynamic>),
      subjects: (json['subjects'] as List<dynamic>?)
          ?.map((e) => Subject.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TeacherToJson(Teacher instance) => <String, dynamic>{
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
      'gender': instance.gender,
      'religion': instance.religion,
      'address': instance.address,
      'grade': instance.grade,
      'subjects': instance.subjects,
    };

FTeacher _$FTeacherFromJson(Map<String, dynamic> json) => FTeacher(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      teacher: (json['teacher'] as List<dynamic>?)
          ?.map((e) => Teacher.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FTeacherToJson(FTeacher instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'teacher': instance.teacher,
    };
