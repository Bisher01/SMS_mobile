// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_timetable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeacherTimeTable _$TeacherTimeTableFromJson(Map<String, dynamic> json) =>
    TeacherTimeTable(
      id: json['id'] as int? ?? 0,
      teacher_id: json['teacher_id'] as int? ?? 0,
      classClassroom_id: json['classClassroom_id'] as int? ?? 0,
      lesson: json['lesson'] == null
          ? null
          : Lesson.fromJson(json['lesson'] as Map<String, dynamic>),
      lessonDay_id: json['lessonDay_id'] as int? ?? 0,
      classroom: json['classroom'] == null
          ? null
          : ClassClassroom.fromJson(json['classroom'] as Map<String, dynamic>),
      subject: json['subject'] == null
          ? null
          : Subject.fromJson(json['subject'] as Map<String, dynamic>),
      subject_id: json['subject_id'] as int? ?? 0,
    );

Map<String, dynamic> _$TeacherTimeTableToJson(TeacherTimeTable instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lessonDay_id': instance.lessonDay_id,
      'classClassroom_id': instance.classClassroom_id,
      'teacher_id': instance.teacher_id,
      'subject_id': instance.subject_id,
      'lesson': instance.lesson,
      'subject': instance.subject,
      'classroom': instance.classroom,
    };

FTeacherTimeTable _$FTeacherTimeTableFromJson(Map<String, dynamic> json) =>
    FTeacherTimeTable(
      message: json['message'] as String?,
      status: json['status'] as bool?,
      teacherTimetable: (json['teacherTimetable'] as List<dynamic>?)
          ?.map((e) => TeacherTimeTable.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FTeacherTimeTableToJson(FTeacherTimeTable instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'teacherTimetable': instance.teacherTimetable,
    };

Day _$DayFromJson(Map<String, dynamic> json) => Day(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$DayToJson(Day instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

MiniLesson _$MiniLessonFromJson(Map<String, dynamic> json) => MiniLesson(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$MiniLessonToJson(MiniLesson instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Lesson _$LessonFromJson(Map<String, dynamic> json) => Lesson(
      id: json['id'] as int? ?? 0,
      day_id: json['day_id'] as int? ?? 0,
      days: json['days'] == null
          ? null
          : Day.fromJson(json['days'] as Map<String, dynamic>),
      lesson_id: json['lesson_id'] as int? ?? 0,
      lessons: json['lessons'] == null
          ? null
          : MiniLesson.fromJson(json['lessons'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LessonToJson(Lesson instance) => <String, dynamic>{
      'id': instance.id,
      'day_id': instance.day_id,
      'lesson_id': instance.lesson_id,
      'lessons': instance.lessons,
      'days': instance.days,
    };
