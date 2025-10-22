// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_correct_question_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckCorrectQuestionDto _$CheckCorrectQuestionDtoFromJson(
        Map<String, dynamic> json) =>
    CheckCorrectQuestionDto(
      qid: json['QID'] as String?,
      question: json['Question'] as String?,
      correctAnswer: json['correctAnswer'] as String?,
      answers: json['answers'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$CheckCorrectQuestionDtoToJson(
        CheckCorrectQuestionDto instance) =>
    <String, dynamic>{
      'QID': instance.qid,
      'Question': instance.question,
      'correctAnswer': instance.correctAnswer,
      'answers': instance.answers,
    };
