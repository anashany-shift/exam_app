// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_exam_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectExamDto _$SubjectExamDtoFromJson(Map<String, dynamic> json) =>
    SubjectExamDto(
      Id: json['_id'] as String?,
      title: json['title'] as String?,
      duration: (json['duration'] as num?)?.toInt(),
      subject: json['subject'] as String?,
      numberOfQuestions: (json['numberOfQuestions'] as num?)?.toInt(),
      active: json['active'] as bool?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$SubjectExamDtoToJson(SubjectExamDto instance) =>
    <String, dynamic>{
      '_id': instance.Id,
      'title': instance.title,
      'duration': instance.duration,
      'subject': instance.subject,
      'numberOfQuestions': instance.numberOfQuestions,
      'active': instance.active,
      'createdAt': instance.createdAt,
    };
