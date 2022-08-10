// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Parent _$ParentFromJson(Map<String, dynamic> json) => Parent(
      id: json['id'] as int? ?? 0,
      phone: json['phone'] as String? ?? '',
      code: json['code'] as String? ?? '',
      email: json['email'] as String? ?? '',
      father_name: json['father_name'] as String? ?? '',
      jop: json['jop'] as String? ?? '',
      mother_name: json['mother_name'] as String? ?? '',
      national_number: json['national_number'] as String? ?? '',
    );

Map<String, dynamic> _$ParentToJson(Parent instance) => <String, dynamic>{
      'id': instance.id,
      'national_number': instance.national_number,
      'mother_name': instance.mother_name,
      'father_name': instance.father_name,
      'code': instance.code,
      'phone': instance.phone,
      'email': instance.email,
      'jop': instance.jop,
    };

FParent _$FParentFromJson(Map<String, dynamic> json) => FParent(
      message: json['message'] as String?,
      status: json['status'] as bool?,
      parent: (json['parent'] as List<dynamic>?)
          ?.map((e) => Parent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FParentToJson(FParent instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'parent': instance.parent,
    };
