// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_parent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FNewParent _$FNewParentFromJson(Map<String, dynamic> json) => FNewParent(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      parent: (json['parent'] as List<dynamic>?)
          ?.map((e) => NewParent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FNewParentToJson(FNewParent instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'parent': instance.parent,
    };

NewParent _$NewParentFromJson(Map<String, dynamic> json) => NewParent(
      id: json['id'] as int?,
      phone: json['phone'] as String?,
      code: json['code'] as String?,
      email: json['email'] as String?,
      father_name: json['father_name'] as String?,
      jop: json['jop'] as String?,
      mother_name: json['mother_name'] as String?,
      national_number: json['national_number'] as String?,
    )..child = (json['child'] as List<dynamic>?)
        ?.map((e) => Student.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$NewParentToJson(NewParent instance) => <String, dynamic>{
      'id': instance.id,
      'national_number': instance.national_number,
      'mother_name': instance.mother_name,
      'father_name': instance.father_name,
      'code': instance.code,
      'phone': instance.phone,
      'email': instance.email,
      'jop': instance.jop,
      'child': instance.child,
    };
