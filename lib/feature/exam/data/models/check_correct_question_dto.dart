import 'package:json_annotation/json_annotation.dart';
part 'check_correct_question_dto.g.dart';
@JsonSerializable()
class CheckCorrectQuestionDto {
  @JsonKey(name: "QID")
  final String? qid;
  @JsonKey(name: "Question")
  final String? question;
  @JsonKey(name: "correctAnswer")
  final String? correctAnswer;
  @JsonKey(name: "answers")
  final Map<String, dynamic>? answers;

  CheckCorrectQuestionDto({
    this.qid,
    this.question,
    this.correctAnswer,
    this.answers,
  });

  factory CheckCorrectQuestionDto.fromJson(Map<String, dynamic> json) =>
      _$CheckCorrectQuestionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CheckCorrectQuestionDtoToJson(this);
}
