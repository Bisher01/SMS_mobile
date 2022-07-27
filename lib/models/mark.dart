import 'package:json_annotation/json_annotation.dart';

part 'mark.g.dart';

@JsonSerializable()
class FMark {
  bool? status;
  String? message;
  List<int>? mark;
  FMark({
    this.message,
    this.status,
    this.mark,
  });

  factory FMark.fromJson(Map<String, dynamic> json) => _$FMarkFromJson(json);
  Map<String, dynamic> toJson() => _$FMarkToJson(this);
}
