// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_question_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckQuestionRequest _$CheckQuestionRequestFromJson(
        Map<String, dynamic> json) =>
    CheckQuestionRequest(
      answers: (json['answers'] as List<dynamic>?)
          ?.map(
              (e) => AnswersQuestionRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      time: (json['time'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CheckQuestionRequestToJson(
        CheckQuestionRequest instance) =>
    <String, dynamic>{
      'answers': instance.answers,
      'time': instance.time,
    };
