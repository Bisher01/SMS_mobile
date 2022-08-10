// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mark.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FMark _$FMarkFromJson(Map<String, dynamic> json) => FMark(
      message: json['message'] as String?,
      status: json['status'] as bool?,
      mark: json['mark'] as int? ?? 0,
    );

Map<String, dynamic> _$FMarkToJson(FMark instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'mark': instance.mark,
    };
