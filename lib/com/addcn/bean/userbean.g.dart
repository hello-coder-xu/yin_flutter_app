// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userbean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Userbean _$UserbeanFromJson(Map<String, dynamic> json) {
  return Userbean(
      json['errNo'] as int,
      json['msg'] as String,
      json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>));
}

Map<String, dynamic> _$UserbeanToJson(Userbean instance) => <String, dynamic>{
      'errNo': instance.errNo,
      'msg': instance.msg,
      'user': instance.user
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
      json['JobNumber'] as int,
      json['avatarURL'] as String,
      json['chatUserUUID'] as String,
      json['name'] as String,
      json['nickName'] as String,
      json['phoneNum'] as String);
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'JobNumber': instance.jobNumber,
      'avatarURL': instance.avatarURL,
      'chatUserUUID': instance.chatUserUUID,
      'name': instance.name,
      'nickName': instance.nickName,
      'phoneNum': instance.phoneNum
    };
