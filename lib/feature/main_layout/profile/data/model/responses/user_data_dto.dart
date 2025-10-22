import 'package:exam_app/feature/main_layout/profile/domain/entities/user_data_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_data_dto.g.dart';

@JsonSerializable()
class UserDataDto {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "username")
  final String? username;
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "lastName")
  final String? lastName;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "role")
  final String? role;
  @JsonKey(name: "isVerified")
  final bool? isVerified;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "passwordResetCode")
  final String? passwordResetCode;
  @JsonKey(name: "passwordResetExpires")
  final String? passwordResetExpires;
  @JsonKey(name: "resetCodeVerified")
  final bool? resetCodeVerified;
  @JsonKey(name: "passwordChangedAt")
  final String? passwordChangedAt;

  UserDataDto({
    this.Id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.isVerified,
    this.createdAt,
    this.passwordResetCode,
    this.passwordResetExpires,
    this.resetCodeVerified,
    this.passwordChangedAt,
  });

  factory UserDataDto.fromJson(Map<String, dynamic> json) {
    return _$UserDataDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserDataDtoToJson(this);
  }
}

extension UserDataMapper on UserDataDto {
  UserDataEntity toEntity() {
  return  UserDataEntity(
      id: Id,
      username: username,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
    );
  }
}
