// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Seed _$SeedFromJson(Map<String, dynamic> json) => Seed(
      academicYears: (json['Academic Years'] as List<dynamic>?)
          ?.map((e) => AcademicYears.fromJson(e as Map<String, dynamic>))
          .toList(),
      nationality: (json['nationality'] as List<dynamic>?)
          ?.map((e) => Nationalities.fromJson(e as Map<String, dynamic>))
          .toList(),
      bloods: (json['bloods'] as List<dynamic>?)
          ?.map((e) => Bloods.fromJson(e as Map<String, dynamic>))
          .toList(),
      classes: (json['classes'] as List<dynamic>?)
          ?.map((e) => Classes.fromJson(e as Map<String, dynamic>))
          .toList(),
      genders: (json['genders'] as List<dynamic>?)
          ?.map((e) => Genders.fromJson(e as Map<String, dynamic>))
          .toList(),
      grades: (json['grades'] as List<dynamic>?)
          ?.map((e) => Grades.fromJson(e as Map<String, dynamic>))
          .toList(),
      religtions: (json['religtions'] as List<dynamic>?)
          ?.map((e) => Religions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SeedToJson(Seed instance) => <String, dynamic>{
      'Academic Years': instance.academicYears,
      'bloods': instance.bloods,
      'classes': instance.classes,
      'genders': instance.genders,
      'grades': instance.grades,
      'religtions': instance.religtions,
      'nationality': instance.nationality,
    };

FSeed _$FSeedFromJson(Map<String, dynamic> json) => FSeed(
      message: json['message'] as String?,
      status: json['status'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Seed.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FSeedToJson(FSeed instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Bloods _$BloodsFromJson(Map<String, dynamic> json) => Bloods(
      id: json['id'] as int? ?? 0,
      type: json['type'] as String? ?? '',
    );

Map<String, dynamic> _$BloodsToJson(Bloods instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
    };

Classes _$ClassesFromJson(Map<String, dynamic> json) => Classes(
      id: json['id'] as int? ?? 0,
      grade_id: json['grade_id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      classroom: (json['classroom'] as List<dynamic>?)
          ?.map((e) => Classroom.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ClassesToJson(Classes instance) => <String, dynamic>{
      'id': instance.id,
      'grade_id': instance.grade_id,
      'name': instance.name,
      'classroom': instance.classroom,
    };

Genders _$GendersFromJson(Map<String, dynamic> json) => Genders(
      id: json['id'] as int? ?? 0,
      type: json['type'] as String? ?? '',
    );

Map<String, dynamic> _$GendersToJson(Genders instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
    };

Grades _$GradesFromJson(Map<String, dynamic> json) => Grades(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$GradesToJson(Grades instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Religions _$ReligionsFromJson(Map<String, dynamic> json) => Religions(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$ReligionsToJson(Religions instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Nationalities _$NationalitiesFromJson(Map<String, dynamic> json) =>
    Nationalities(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$NationalitiesToJson(Nationalities instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
