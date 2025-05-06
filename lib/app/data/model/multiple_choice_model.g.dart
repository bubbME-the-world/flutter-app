// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multiple_choice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MultipleChoiceModel _$MultipleChoiceModelFromJson(Map<String, dynamic> json) =>
    MultipleChoiceModel(
      answer: json['answer'] as String?,
      correctAnswer: json['correct_answer'] as bool?,
    );

Map<String, dynamic> _$MultipleChoiceModelToJson(
        MultipleChoiceModel instance) =>
    <String, dynamic>{
      'answer': instance.answer,
      'correct_answer': instance.correctAnswer,
    };
