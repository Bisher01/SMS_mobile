// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceModel _$AttendanceModelFromJson(Map<String, dynamic> json) =>
    AttendanceModel(
      date: json['date'] as String? ?? '',
      students: (json['students'] as List<dynamic>?)
          ?.map((e) => StudentAttendance.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AttendanceModelToJson(AttendanceModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'students': instance.students,
    };

StudentAttendance _$StudentAttendanceFromJson(Map<String, dynamic> json) =>
    StudentAttendance(
      id: json['student_id'] as int? ?? 0,
      status: json['status_id'] as int? ?? 0,
    );

Map<String, dynamic> _$StudentAttendanceToJson(StudentAttendance instance) =>
    <String, dynamic>{
      'student_id': instance.id,
      'status_id': instance.status,
    };

MentorClasses _$MentorClassesFromJson(Map<String, dynamic> json) =>
    MentorClasses(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      mentorData: (json['data'] as List<dynamic>?)
          ?.map((e) => MentorClassesData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MentorClassesToJson(MentorClasses instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.mentorData,
    };

MentorClassesData _$MentorClassesDataFromJson(Map<String, dynamic> json) =>
    MentorClassesData(
      id: json['id'] as int?,
      classId: json['class_id'] as int? ?? 0,
      classRoomId: json['classroom_id'] as int? ?? 0,
      classrooms: json['classrooms'] == null
          ? null
          : Classroom.fromJson(json['classrooms'] as Map<String, dynamic>),
      students: (json['students'] as List<dynamic>?)
          ?.map((e) => Student.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MentorClassesDataToJson(MentorClassesData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'class_id': instance.classId,
      'classroom_id': instance.classRoomId,
      'classrooms': instance.classrooms,
      'students': instance.students,
    };
