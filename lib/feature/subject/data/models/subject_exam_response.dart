import 'package:exam_app/feature/subject/data/models/subject_exam_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subject_exam_response.g.dart';

@JsonSerializable()
class SubjectExamResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final Metadata? metadata;
  @JsonKey(name: "exams")
  final List<SubjectExamDto>? exams;

  SubjectExamResponse ({
    this.message,
    this.metadata,
    this.exams,
  });

  factory SubjectExamResponse.fromJson(Map<String, dynamic> json) {
    return _$SubjectExamResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SubjectExamResponseToJson(this);
  }
}

@JsonSerializable()
class Metadata {
  @JsonKey(name: "currentPage")
  final int? currentPage;
  @JsonKey(name: "numberOfPages")
  final int? numberOfPages;
  @JsonKey(name: "limit")
  final int? limit;

  Metadata ({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return _$MetadataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MetadataToJson(this);
  }
}




