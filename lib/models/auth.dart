import 'package:json_annotation/json_annotation.dart';

part 'auth.g.dart';

@JsonSerializable()
class Auth {
  bool? status;
  String? message;
  String? role;
  int? id;
  Keys? key;

  Auth({
    this.id,
    this.status,
    this.message,
    this.key,
    this.role,
  });

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);
  Map<String, dynamic> toJson() => _$AuthToJson(this);
}

@JsonSerializable()
class Keys{
String? Bearer;
String? token;



  Keys({
  this.token,
    this.Bearer

  });

  factory Keys.fromJson(Map<String, dynamic> json) =>
      _$KeysFromJson(json);
  Map<String, dynamic> toJson() => _$KeysToJson(this);

}
