// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mentor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mentor _$MentorFromJson(Map<String, dynamic> json) => Mentor(
      address_id: json['address_id'] as int? ?? 0,
      code: json['code'] as String? ?? '',
      email: json['email'] as String? ?? '',
      f_name: json['f_name'] as String? ?? '',
      id: json['id'] as int? ?? 0,
      l_name: json['l_name'] as String? ?? '',
      joining_date: json['joining_date'] as String? ?? '',
      class_id: json['class_id'] as int? ?? 0,
      phone: json['phone'] as String? ?? '',
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      classes: json['class'] == null
          ? null
          : Class.fromJson(json['class'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MentorToJson(Mentor instance) => <String, dynamic>{
      'id': instance.id,
      'f_name': instance.f_name,
      'l_name': instance.l_name,
      'email': instance.email,
      'code': instance.code,
      'joining_date': instance.joining_date,
      'phone': instance.phone,
      'class_id': instance.class_id,
      'address_id': instance.address_id,
      'class': instance.classes,
      'address': instance.address,
    };

FMentor _$FMentorFromJson(Map<String, dynamic> json) => FMentor(
      message: json['message'] as String?,
      status: json['status'] as bool?,
      mentor: (json['mentor'] as List<dynamic>?)
          ?.map((e) => Mentor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FMentorToJson(FMentor instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'mentor': instance.mentor,
    };
