import 'package:json_annotation/json_annotation.dart';
part 'check_wrong_question_dto.g.dart';
@JsonSerializable()
class CheckWrongQuestionDto {
  @JsonKey(name: "QID")
  final String? qid;
  @JsonKey(name: "Question")
  final String? question;
  @JsonKey(name: "inCorrectAnswer")
  final String? inCorrectAnswer;
  @JsonKey(name: "correctAnswer")
  final String? correctAnswer;
  @JsonKey(name: "answers")
  final Map<String, dynamic>? answers;

  CheckWrongQuestionDto({
    this.qid,
    this.question,
    this.inCorrectAnswer,
    this.correctAnswer,
    this.answers,
  });

  factory CheckWrongQuestionDto.fromJson(Map<String, dynamic> json) =>
      _$CheckWrongQuestionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CheckWrongQuestionDtoToJson(this);
}

