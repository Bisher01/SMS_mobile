import 'package:json_annotation/json_annotation.dart';

part 'admin.g.dart';

@JsonSerializable()
class Admin{
  int? id;
  String? email;
  String? created_at;
  String? updated_at;
  Admin({
    this.email,
    this.created_at,
    this.id,
    this.updated_at
});

  factory Admin.fromJson(Map<String, dynamic> json) =>
      _$AdminFromJson(json);
  Map<String, dynamic> toJson() => _$AdminToJson(this);

}
@JsonSerializable()
class AdminData{
  Admin? admin;
  String? type;
  String? token;
  AdminData({
    this.admin,
    this.token,
    this.type,
});
  factory AdminData.fromJson(Map<String, dynamic> json) =>
      _$AdminDataFromJson(json);
  Map<String, dynamic> toJson() => _$AdminDataToJson(this);

}
@JsonSerializable()
class FAdmin{
  AdminData? data;
  bool? status;
  String? message;
  FAdmin({
    this.status,
    this.message,
    this.data
});
  factory FAdmin.fromJson(Map<String, dynamic> json) =>
      _$FAdminFromJson(json);
  Map<String, dynamic> toJson() => _$FAdminToJson(this);
}