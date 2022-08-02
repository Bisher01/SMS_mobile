import 'package:json_annotation/json_annotation.dart';

part 'log_out.g.dart';

@JsonSerializable()
class LogOut{
  String? message;
  LogOut({
    this.message,
  });

  factory LogOut.fromJson(Map<String, dynamic> json) =>
      _$LogOutFromJson(json);
  Map<String, dynamic> toJson() => _$LogOutToJson(this);

}
