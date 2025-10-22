// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_wrong_question_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckWrongQuestionDto _$CheckWrongQuestionDtoFromJson(
        Map<String, dynamic> json) =>
    CheckWrongQuestionDto(
      qid: json['QID'] as String?,
      question: json['Question'] as String?,
      inCorrectAnswer: json['inCorrectAnswer'] as String?,
      correctAnswer: json['correctAnswer'] as String?,
      answers: json['answers'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$CheckWrongQuestionDtoToJson(
        CheckWrongQuestionDto instance) =>
    <String, dynamic>{
      'QID': instance.qid,
      'Question': instance.question,
      'inCorrectAnswer': instance.inCorrectAnswer,
      'correctAnswer': instance.correctAnswer,
      'answers': instance.answers,
    };
