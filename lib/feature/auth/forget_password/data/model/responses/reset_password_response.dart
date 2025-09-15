import 'package:exam_app/feature/auth/forget_password/domain/entities/reset_password_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reset_password_response.g.dart';

@JsonSerializable()
class ResetPasswordResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "token")
  final String? token;

  ResetPasswordResponse ({
    this.message,
    this.token,
  });

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) {
    return _$ResetPasswordResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ResetPasswordResponseToJson(this);
  }
}

extension ResetPasswordlResponseMapper on ResetPasswordResponse{

  ResetPasswordEntity toEntity(){
    return ResetPasswordEntity(token: token??"");
  }

}
