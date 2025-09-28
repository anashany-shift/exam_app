import 'package:json_annotation/json_annotation.dart';

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
  final List<WrongQuestion>? wrongQuestions;
  @JsonKey(name: "correctQuestions")
  final List<CorrectQuestion>? correctQuestions;

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

@JsonSerializable()
class WrongQuestion {
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

  WrongQuestion({
    this.qid,
    this.question,
    this.inCorrectAnswer,
    this.correctAnswer,
    this.answers,
  });

  factory WrongQuestion.fromJson(Map<String, dynamic> json) =>
      _$WrongQuestionFromJson(json);

  Map<String, dynamic> toJson() => _$WrongQuestionToJson(this);
}

@JsonSerializable()
class CorrectQuestion {
  @JsonKey(name: "QID")
  final String? qid;
  @JsonKey(name: "Question")
  final String? question;
  @JsonKey(name: "correctAnswer")
  final String? correctAnswer;
  @JsonKey(name: "answers")
  final Map<String, dynamic>? answers;

  CorrectQuestion({
    this.qid,
    this.question,
    this.correctAnswer,
    this.answers,
  });

  factory CorrectQuestion.fromJson(Map<String, dynamic> json) =>
      _$CorrectQuestionFromJson(json);

  Map<String, dynamic> toJson() => _$CorrectQuestionToJson(this);
}
