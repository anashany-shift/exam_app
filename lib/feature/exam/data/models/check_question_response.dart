import 'package:exam_app/feature/exam/domain/entities/check_question_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import 'check_correct_question_dto.dart';
import 'check_wrong_question_dto.dart';

part 'check_question_response.g.dart';

@JsonSerializable()
class CheckQuestionResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "correct")
  final int? correct;
  @JsonKey(name: "wrong")
  final int? wrong;
  @JsonKey(name: "total")
  final String? total;
  @JsonKey(name: "WrongQuestions")
  final List<CheckWrongQuestionDto>? wrongQuestions;
  @JsonKey(name: "correctQuestions")
  final List<CheckCorrectQuestionDto>? correctQuestions;

  CheckQuestionResponse({
    this.message,
    this.correct,
    this.wrong,
    this.total,
    this.wrongQuestions,
    this.correctQuestions,
  });

  factory CheckQuestionResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckQuestionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CheckQuestionResponseToJson(this);
}

extension CheckQuestionResponseMapper on CheckQuestionResponse {
  CheckQuestionEntity toEntity() {
    return CheckQuestionEntity(correct: correct, wrong: wrong, total: total);
  }
}
