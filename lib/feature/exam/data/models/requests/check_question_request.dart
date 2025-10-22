import 'package:json_annotation/json_annotation.dart';

import 'answer_question_request.dart';

part 'check_question_request.g.dart';

@JsonSerializable()
class CheckQuestionRequest {
  @JsonKey(name: "answers")
  final List<AnswersQuestionRequest>? answers;
  @JsonKey(name: "time")
  final int? time;

  CheckQuestionRequest ({
    this.answers,
    this.time,
  });

  factory CheckQuestionRequest.fromJson(Map<String, dynamic> json) {
    return _$CheckQuestionRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CheckQuestionRequestToJson(this);
  }
}


