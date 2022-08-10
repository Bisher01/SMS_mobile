import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  @JsonKey(defaultValue: 0)
  int? id;
  @JsonKey(defaultValue: '')
  String? city;
  @JsonKey(defaultValue: '')
  String? town;
  @JsonKey(defaultValue: '')
  String? street;
  Address({this.id, this.city, this.street, this.town});

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@JsonSerializable()
class FAddress {
  bool? status;
  String? message;
  List<Address>? address;
  FAddress({this.message, this.status, this.address});

  factory FAddress.fromJson(Map<String, dynamic> json) =>
      _$FAddressFromJson(json);
  Map<String, dynamic> toJson() => _$FAddressToJson(this);
}
