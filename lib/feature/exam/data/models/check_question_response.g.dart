// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_question_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckQuestionResponse _$CheckQuestionResponseFromJson(
        Map<String, dynamic> json) =>
    CheckQuestionResponse(
      message: json['message'] as String?,
      correct: (json['correct'] as num?)?.toInt(),
      wrong: (json['wrong'] as num?)?.toInt(),
      total: json['total'] as String?,
      wrongQuestions: (json['WrongQuestions'] as List<dynamic>?)
          ?.map(
              (e) => CheckWrongQuestionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      correctQuestions: (json['correctQuestions'] as List<dynamic>?)
          ?.map((e) =>
              CheckCorrectQuestionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CheckQuestionResponseToJson(
        CheckQuestionResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'correct': instance.correct,
      'wrong': instance.wrong,
      'total': instance.total,
      'WrongQuestions': instance.wrongQuestions,
      'correctQuestions': instance.correctQuestions,
    };
