// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      updated_at: json['updated_at'] as String?,
      id: json['id'] as int?,
      created_at: json['created_at'] as String?,
      city: json['city'] as String?,
      street: json['street'] as String?,
      town: json['town'] as String?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'id': instance.id,
      'city': instance.city,
      'town': instance.town,
      'street': instance.street,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };

FAddress _$FAddressFromJson(Map<String, dynamic> json) => FAddress(
      message: json['message'] as String?,
      status: json['status'] as bool?,
      address: (json['address'] as List<dynamic>?)
          ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FAddressToJson(FAddress instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'address': instance.address,
    };
