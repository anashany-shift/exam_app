import 'package:exam_app/feature/subject/domain/entities/subject_exam_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'subject_exam_dto.g.dart';

@JsonSerializable()
class SubjectExamDto {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "duration")
  final int? duration;
  @JsonKey(name: "subject")
  final String? subject;
  @JsonKey(name: "numberOfQuestions")
  final int? numberOfQuestions;
  @JsonKey(name: "active")
  final bool? active;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  SubjectExamDto({
    this.Id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  factory SubjectExamDto.fromJson(Map<String, dynamic> json) {
    return _$SubjectExamDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SubjectExamDtoToJson(this);
  }
}

extension SubjectExamResponseMapper on SubjectExamDto {
  SubjectExamEntity toEntity() {
    return SubjectExamEntity(
      title: title,
      id: Id,
      duration: duration,
      numberOfQuestions: numberOfQuestions,
    );
  }
}
