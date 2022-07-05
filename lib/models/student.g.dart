// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Student _$StudentFromJson(Map<String, dynamic> json) => Student(
      academic_year_id: json['academic_year_id'] as int?,
      address_id: json['address_id'] as int?,
      birthdate: json['birthdate'] as String?,
      blood_id: json['blood_id'] as int?,
      class_id: json['class_id'] as int?,
      classroom_id: json['classroom_id'] as int?,
      code: json['code'] as String?,
      created_at: json['created_at'] as String?,
      deleted_at: json['deleted_at'] as String?,
      email: json['email'] as String?,
      f_name: json['f_name'] as String?,
      gender_id: json['gender_id'] as int?,
      grade_id: json['grade_id'] as int?,
      id: json['id'] as int?,
      l_name: json['l_name'] as String?,
      nationality_id: json['nationality_id'] as int?,
      parent_id: json['parent_id'] as int?,
      picture: json['picture'] as String? ?? '',
      parent: json['parent'] == null
          ? null
          : Parent.fromJson(json['parent'] as Map<String, dynamic>),
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      religion_id: json['religion_id'] as int?,
      updated_at: json['updated_at'] as String?,
    );

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'id': instance.id,
      'f_name': instance.f_name,
      'l_name': instance.l_name,
      'email': instance.email,
      'code': instance.code,
      'picture': instance.picture,
      'birthdate': instance.birthdate,
      'nationality_id': instance.nationality_id,
      'parent_id': instance.parent_id,
      'blood_id': instance.blood_id,
      'gender_id': instance.gender_id,
      'religion_id': instance.religion_id,
      'grade_id': instance.grade_id,
      'class_id': instance.class_id,
      'classroom_id': instance.classroom_id,
      'academic_year_id': instance.academic_year_id,
      'address_id': instance.address_id,
      'deleted_at': instance.deleted_at,
      'parent': instance.parent,
      'address': instance.address,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };

FStudent _$FStudentFromJson(Map<String, dynamic> json) => FStudent(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      student: (json['student'] as List<dynamic>?)
          ?.map((e) => Student.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FStudentToJson(FStudent instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'student': instance.student,
    };
