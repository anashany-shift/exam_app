import 'package:exam_app/feature/main_layout/profile/data/model/responses/user_data_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_data_response.g.dart';

@JsonSerializable()
class ProfileDataResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "user")
  final UserDataDto? user;

  ProfileDataResponse ({
    this.message,
    this.user,
  });

  factory ProfileDataResponse.fromJson(Map<String, dynamic> json) {
    return _$ProfileDataResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProfileDataResponseToJson(this);
  }
}

