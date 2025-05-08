// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'squad_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Squad _$SquadFromJson(Map<String, dynamic> json) => Squad(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  order: (json['order'] as num).toInt(),
  users:
      (json['users'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$SquadToJson(Squad instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'order': instance.order,
  'users': instance.users,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};
