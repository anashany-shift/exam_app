import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/subjects_entity.dart';

part 'subject_dto.g.dart';

@JsonSerializable()
class SubjectsDto {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "icon")
  final String? icon;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  SubjectsDto({this.Id, this.name, this.icon, this.createdAt});

  factory SubjectsDto.fromJson(Map<String, dynamic> json) {
    return _$SubjectsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SubjectsDtoToJson(this);
  }
}

extension SubjectsResponseMapper on SubjectsDto {
  SubjectEntity toEntity() {
    return SubjectEntity(id: Id ?? "", name: name ?? "", icon: icon ?? "");
  }
}
