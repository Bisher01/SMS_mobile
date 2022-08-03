// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditQuestionChoices _$EditQuestionChoicesFromJson(Map<String, dynamic> json) =>
    EditQuestionChoices(
      id: json['id'] as int?,
      status: json['status'] as int?,
      text: json['text'] as String?,
    );

Map<String, dynamic> _$EditQuestionChoicesToJson(
        EditQuestionChoices instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'status': instance.status,
    };

EditQuestionModel _$EditQuestionModelFromJson(Map<String, dynamic> json) =>
    EditQuestionModel(
      text: json['text'] as String?,
      choices: (json['choices'] as List<dynamic>)
          .map((e) => EditQuestionChoices.fromJson(e as Map<String, dynamic>))
          .toList(),
      method: json['_method'] as String?,
    );

Map<String, dynamic> _$EditQuestionModelToJson(EditQuestionModel instance) =>
    <String, dynamic>{
      'text': instance.text,
      'choices': instance.choices,
      '_method': instance.method,
    };
