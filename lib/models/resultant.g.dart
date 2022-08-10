// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resultant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Resultant _$ResultantFromJson(Map<String, dynamic> json) => Resultant(
      exam: (json['exam'] as num?)?.toDouble() ?? 0,
      oralTest: (json['oralTest'] as num?)?.toDouble() ?? 0,
      quize: (json['quize'] as num?)?.toDouble() ?? 0,
      subjectMark: (json['subjectMark'] as num?)?.toDouble() ?? 0,
      subjectName: json['subjectName'] as String? ?? '',
      test: (json['test'] as num?)?.toDouble() ?? 0,
      totalMark: (json['totalMark'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$ResultantToJson(Resultant instance) => <String, dynamic>{
      'subjectName': instance.subjectName,
      'subjectMark': instance.subjectMark,
      'quize': instance.quize,
      'exam': instance.exam,
      'test': instance.test,
      'oralTest': instance.oralTest,
      'totalMark': instance.totalMark,
    };

FResultant _$FResultantFromJson(Map<String, dynamic> json) => FResultant(
      message: json['message'] as String?,
      status: json['status'] as bool?,
      resultant: (json['resultant'] as List<dynamic>?)
          ?.map((e) => Resultant.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FResultantToJson(FResultant instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'resultant': instance.resultant,
    };
