// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mark.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FMark _$FMarkFromJson(Map<String, dynamic> json) => FMark(
      message: json['message'] as String?,
      status: json['status'] as bool?,
      marks: (json['marks'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$FMarkToJson(FMark instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'marks': instance.marks,
    };
