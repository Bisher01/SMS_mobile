// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Admin _$AdminFromJson(Map<String, dynamic> json) => Admin(
      email: json['email'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$AdminToJson(Admin instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
    };

AdminData _$AdminDataFromJson(Map<String, dynamic> json) => AdminData(
      admin: json['admin'] == null
          ? null
          : Admin.fromJson(json['admin'] as Map<String, dynamic>),
      token: json['token'] as String?,
      Bearer: json['Bearer'] as String?,
    );

Map<String, dynamic> _$AdminDataToJson(AdminData instance) => <String, dynamic>{
      'admin': instance.admin,
      'Bearer': instance.Bearer,
      'token': instance.token,
    };

FAdmin _$FAdminFromJson(Map<String, dynamic> json) => FAdmin(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AdminData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FAdminToJson(FAdmin instance) => <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
    };
