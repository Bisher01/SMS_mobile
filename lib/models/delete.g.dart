// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Delete _$DeleteFromJson(Map<String, dynamic> json) => Delete(
      message: json['message'] as String?,
      status: json['status'] as bool?,
    );

Map<String, dynamic> _$DeleteToJson(Delete instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
