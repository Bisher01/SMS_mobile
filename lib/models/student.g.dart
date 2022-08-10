// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Student _$StudentFromJson(Map<String, dynamic> json) => Student(
      academic_year_id: json['academic_year_id'] as int? ?? 0,
      address_id: json['address_id'] as int? ?? 0,
      birthdate: json['birthdate'] as String? ?? '',
      blood_id: json['blood_id'] as int? ?? 0,
      code: json['code'] as String? ?? '',
      email: json['email'] as String? ?? '',
      f_name: json['f_name'] as String? ?? '',
      gender_id: json['gender_id'] as int? ?? 0,
      grade_id: json['grade_id'] as int? ?? 0,
      id: json['id'] as int? ?? 0,
      l_name: json['l_name'] as String? ?? '',
      nationality_id: json['nationality_id'] as int? ?? 0,
      parent_id: json['parent_id'] as int? ?? 0,
      picture: json['picture'] as String? ?? '',
      parent: json['parent'] == null
          ? null
          : Parent.fromJson(json['parent'] as Map<String, dynamic>),
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      religion_id: json['religion_id'] as int? ?? 0,
      religion: json['religion'] == null
          ? null
          : Religion.fromJson(json['religion'] as Map<String, dynamic>),
      nationality: json['nationality'] == null
          ? null
          : Nationality.fromJson(json['nationality'] as Map<String, dynamic>),
      academic_year: json['academic_year'] == null
          ? null
          : AcademicYears.fromJson(
              json['academic_year'] as Map<String, dynamic>),
      blood: json['blood'] == null
          ? null
          : Blood.fromJson(json['blood'] as Map<String, dynamic>),
      gender: json['gender'] == null
          ? null
          : Gender.fromJson(json['gender'] as Map<String, dynamic>),
      grade: json['grade'] == null
          ? null
          : Grade.fromJson(json['grade'] as Map<String, dynamic>),
      class_classroom_id: json['class_classroom_id'] as int? ?? 0,
      class_classroom: json['class_classroom'] == null
          ? null
          : ClassClassroom.fromJson(
              json['class_classroom'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'id': instance.id,
      'f_name': instance.f_name,
      'l_name': instance.l_name,
      'email': instance.email,
      'code': instance.code,
      'picture': instance.picture,
      'birthdate': instance.birthdate,
      'parent_id': instance.parent_id,
      'blood_id': instance.blood_id,
      'gender_id': instance.gender_id,
      'nationality_id': instance.nationality_id,
      'religion_id': instance.religion_id,
      'grade_id': instance.grade_id,
      'class_classroom_id': instance.class_classroom_id,
      'academic_year_id': instance.academic_year_id,
      'address_id': instance.address_id,
      'grade': instance.grade,
      'class_classroom': instance.class_classroom,
      'academic_year': instance.academic_year,
      'address': instance.address,
      'parent': instance.parent,
      'blood': instance.blood,
      'religion': instance.religion,
      'gender': instance.gender,
      'nationality': instance.nationality,
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
