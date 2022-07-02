// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Admin _$AdminFromJson(Map<String, dynamic> json) => Admin(
      email: json['email'] as String?,
      created_at: json['created_at'] as String?,
      id: json['id'] as int?,
      updated_at: json['updated_at'] as String?,
    );

Map<String, dynamic> _$AdminToJson(Admin instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };

AdminData _$AdminDataFromJson(Map<String, dynamic> json) => AdminData(
      admin: json['admin'] == null
          ? null
          : Admin.fromJson(json['admin'] as Map<String, dynamic>),
      token: json['token'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$AdminDataToJson(AdminData instance) => <String, dynamic>{
      'admin': instance.admin,
      'type': instance.type,
      'token': instance.token,
    };

FAdmin _$FAdminFromJson(Map<String, dynamic> json) => FAdmin(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : AdminData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FAdminToJson(FAdmin instance) => <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
    };
