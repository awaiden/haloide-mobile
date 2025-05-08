// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  slug: json['slug'] as String,
  tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
  isFeatured: json['isFeatured'] as bool? ?? false,
  cover: json['cover'] as String?,
  file: json['file'] as String?,
  categoryId: json['categoryId'] as String,
  category:
      json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'slug': instance.slug,
  'tags': instance.tags,
  'isFeatured': instance.isFeatured,
  'cover': instance.cover,
  'file': instance.file,
  'categoryId': instance.categoryId,
  'category': instance.category,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};
