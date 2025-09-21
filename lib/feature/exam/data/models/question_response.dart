import 'package:exam_app/feature/exam/data/models/questions_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'question_response.g.dart';

@JsonSerializable()
class QuestionResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "questions")
  final List<QuestionsDto>? questionsDto;

  QuestionResponse ({
    this.message,
    this.questionsDto,
  });

  factory QuestionResponse.fromJson(Map<String, dynamic> json) {
    return _$QuestionResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$QuestionResponseToJson(this);
  }
}






