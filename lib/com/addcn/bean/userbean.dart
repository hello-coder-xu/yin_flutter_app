import 'package:json_annotation/json_annotation.dart';

part 'userbean.g.dart';


@JsonSerializable()
class Userbean extends Object {

  @JsonKey(name: 'errNo')
  int errNo;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'user')
  User user;

  Userbean(this.errNo,this.msg,this.user,);

  factory Userbean.fromJson(Map<String, dynamic> srcJson) => _$UserbeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserbeanToJson(this);

}


@JsonSerializable()
class User extends Object {

  @JsonKey(name: 'JobNumber')
  int jobNumber;

  @JsonKey(name: 'avatarURL')
  String avatarURL;

  @JsonKey(name: 'chatUserUUID')
  String chatUserUUID;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'nickName')
  String nickName;

  @JsonKey(name: 'phoneNum')
  String phoneNum;

  User(this.jobNumber,this.avatarURL,this.chatUserUUID,this.name,this.nickName,this.phoneNum,);

  factory User.fromJson(Map<String, dynamic> srcJson) => _$UserFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserToJson(this);

}


