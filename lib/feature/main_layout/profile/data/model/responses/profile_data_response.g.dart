// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileDataResponse _$ProfileDataResponseFromJson(Map<String, dynamic> json) =>
    ProfileDataResponse(
      message: json['message'] as String?,
      user: json['user'] == null
          ? null
          : UserDataDto.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileDataResponseToJson(
        ProfileDataResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'user': instance.user,
    };
