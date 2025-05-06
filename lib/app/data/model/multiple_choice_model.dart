import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/multiple_choice.dart';

part 'multiple_choice_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MultipleChoiceModel extends Equatable {
  @JsonKey(name: 'answer')
  final String? answer;
  @JsonKey(name: 'correct_answer')
  final bool? correctAnswer;

  const MultipleChoiceModel({
    this.answer,
    this.correctAnswer,
  });

  factory MultipleChoiceModel.fromJson(Map<String, dynamic> json) =>
      _$MultipleChoiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$MultipleChoiceModelToJson(this);

  MultipleChoice toEntity() {
    return MultipleChoice(
      answer: answer,
      correctAnswer: correctAnswer,
    );
  }

  @override
  List<Object?> get props => [
        answer,
        correctAnswer,
      ];
}
