// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_question_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswersQuestionRequest _$AnswersQuestionRequestFromJson(
        Map<String, dynamic> json) =>
    AnswersQuestionRequest(
      questionId: json['questionId'] as String?,
      correct: json['correct'] as String?,
    );

Map<String, dynamic> _$AnswersQuestionRequestToJson(
        AnswersQuestionRequest instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'correct': instance.correct,
    };
