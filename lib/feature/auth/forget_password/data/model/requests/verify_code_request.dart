import 'package:json_annotation/json_annotation.dart';

part 'verify_code_request.g.dart';

@JsonSerializable()
class VerifyCodeRequest {
  @JsonKey(name: "resetCode")
  final String? resetCode;

  VerifyCodeRequest ({
    this.resetCode,
  });

  factory VerifyCodeRequest.fromJson(Map<String, dynamic> json) {
    return _$VerifyCodeRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$VerifyCodeRequestToJson(this);
  }
}


