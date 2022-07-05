// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Auth _$AuthFromJson(Map<String, dynamic> json) => Auth(
      id: json['id'] as int?,
      status: json['status'] as bool?,
      message: json['message'] as String?,
      key: json['key'] == null
          ? null
          : Keys.fromJson(json['key'] as Map<String, dynamic>),
      role: json['role'] as String?,
    );

Map<String, dynamic> _$AuthToJson(Auth instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'role': instance.role,
      'id': instance.id,
      'key': instance.key,
    };

Keys _$KeysFromJson(Map<String, dynamic> json) => Keys(
      token: json['token'] as String?,
      Bearer: json['Bearer'] as String?,
    );

Map<String, dynamic> _$KeysToJson(Keys instance) => <String, dynamic>{
      'Bearer': instance.Bearer,
      'token': instance.token,
    };
