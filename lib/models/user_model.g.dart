// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: json['id'] as String,
  username: json['username'] as String,
  email: json['email'] as String,
  password: json['password'] as String,
  displayName: json['displayName'] as String?,
  bio: json['bio'] as String?,
  website: json['website'] as String?,
  title: json['title'] as String?,
  avatar: json['avatar'] as String?,
  squadId: json['squadId'] as String?,
  squad:
      json['squad'] == null
          ? null
          : Squad.fromJson(json['squad'] as Map<String, dynamic>),
  roles:
      (json['roles'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$RoleEnumMap, e))
          .toList() ??
      const [Role.USER],
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'username': instance.username,
  'email': instance.email,
  'password': instance.password,
  'displayName': instance.displayName,
  'bio': instance.bio,
  'website': instance.website,
  'title': instance.title,
  'avatar': instance.avatar,
  'squadId': instance.squadId,
  'squad': instance.squad,
  'roles': instance.roles.map((e) => _$RoleEnumMap[e]!).toList(),
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};

const _$RoleEnumMap = {Role.USER: 'USER', Role.ADMIN: 'ADMIN'};
