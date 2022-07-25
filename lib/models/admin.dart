import 'package:json_annotation/json_annotation.dart';

part 'admin.g.dart';

@JsonSerializable()
class Admin{
  int? id;
  String? email;
  Admin({
    this.email,
    this.id,
});

  factory Admin.fromJson(Map<String, dynamic> json) =>
      _$AdminFromJson(json);
  Map<String, dynamic> toJson() => _$AdminToJson(this);

}
@JsonSerializable()
class AdminData{
  Admin? admin;
  String? Bearer;
  String? token;
  AdminData({
    this.admin,
    this.token,
    this.Bearer,
});
  factory AdminData.fromJson(Map<String, dynamic> json) =>
      _$AdminDataFromJson(json);
  Map<String, dynamic> toJson() => _$AdminDataToJson(this);

}
@JsonSerializable()
class FAdmin{
  List<AdminData>? data;
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