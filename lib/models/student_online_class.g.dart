// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_online_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentOnlineClass _$StudentOnlineClassFromJson(Map<String, dynamic> json) =>
    StudentOnlineClass(
      id: json['id'] as int?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      teacher_subject_id: json['teacher_subject_id'] as int?,
      link: json['link'] as String?,
      teacher_subject: json['teacher_subject'] == null
          ? null
          : StudentTeacherSubjects.fromJson(
              json['teacher_subject'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StudentOnlineClassToJson(StudentOnlineClass instance) =>
    <String, dynamic>{
      'id': instance.id,
      'link': instance.link,
      'date': instance.date?.toIso8601String(),
      'teacher_subject_id': instance.teacher_subject_id,
      'teacher_subject': instance.teacher_subject,
    };

FStudentOnlineClass _$FStudentOnlineClassFromJson(Map<String, dynamic> json) =>
    FStudentOnlineClass(
      message: json['message'] as String?,
      status: json['status'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => StudentOnlineClass.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FStudentOnlineClassToJson(
        FStudentOnlineClass instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

StudentTeacherSubjects _$StudentTeacherSubjectsFromJson(
        Map<String, dynamic> json) =>
    StudentTeacherSubjects(
      id: json['id'] as int?,
      subject_id: json['subject_id'] as int?,
      subjects: json['subjects'] == null
          ? null
          : Subject.fromJson(json['subjects'] as Map<String, dynamic>),
      class_classroom_id: json['class_classroom_id'] as int?,
      teacher_id: json['teacher_id'] as int?,
      teachers: json['teachers'] == null
          ? null
          : StudentTeacher.fromJson(json['teachers'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StudentTeacherSubjectsToJson(
        StudentTeacherSubjects instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subject_id': instance.subject_id,
      'teacher_id': instance.teacher_id,
      'class_classroom_id': instance.class_classroom_id,
      'subjects': instance.subjects,
      'teachers': instance.teachers,
    };

StudentTeacher _$StudentTeacherFromJson(Map<String, dynamic> json) =>
    StudentTeacher(
      id: json['id'] as int?,
      picture: json['picture'] as String? ?? '',
      salary: json['salary'] as String?,
      religion_id: json['religion_id'] as int?,
      gender_id: json['gender_id'] as int?,
      f_name: json['f_name'] as String?,
      joining_date: json['joining_date'] as String?,
      code: json['code'] as String?,
      l_name: json['l_name'] as String?,
      email: json['email'] as String?,
      address_id: json['address_id'] as int?,
    );

Map<String, dynamic> _$StudentTeacherToJson(StudentTeacher instance) =>
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
    };
