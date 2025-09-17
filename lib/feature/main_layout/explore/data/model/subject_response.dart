import 'package:exam_app/feature/main_layout/explore/data/model/subject_dto.dart';
import 'package:json_annotation/json_annotation.dart';

import 'meta_data_dto.dart';

part 'subject_response.g.dart';

@JsonSerializable()
class SubjectResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final MetadataDto? metadata;
  @JsonKey(name: "subjects")
  final List<SubjectsDto>? subjects;

  SubjectResponse ({
    this.message,
    this.metadata,
    this.subjects,
  });

  factory SubjectResponse.fromJson(Map<String, dynamic> json) {
    return _$SubjectResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SubjectResponseToJson(this);
  }
}



