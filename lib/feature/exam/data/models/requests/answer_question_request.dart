import 'package:json_annotation/json_annotation.dart';
part 'answer_question_request.g.dart';
@JsonSerializable()
class AnswersQuestionRequest {
  @JsonKey(name: "questionId")
  final String? questionId;
  @JsonKey(name: "correct")
  final String? correct;

  AnswersQuestionRequest ({
    this.questionId,
    this.correct,
  });

  factory AnswersQuestionRequest.fromJson(Map<String, dynamic> json) {
    return _$AnswersQuestionRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AnswersQuestionRequestToJson(this);
  }
}

