import 'package:exam_app/feature/auth/forget_password/domain/entities/veify_code_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verify_code_response.g.dart';

@JsonSerializable()
class VerifyCodeResponse {
  @JsonKey(name: "status")
  final String? status;

  VerifyCodeResponse ({
    this.status,
  });

  factory VerifyCodeResponse.fromJson(Map<String, dynamic> json) {
    return _$VerifyCodeResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$VerifyCodeResponseToJson(this);
  }
}


extension VerifyCodeResponseMapper on VerifyCodeResponse{
  VerifyCodeEntity toEntity(){
   return VerifyCodeEntity(status: status??"");
  }
}