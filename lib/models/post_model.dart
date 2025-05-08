import 'package:json_annotation/json_annotation.dart';
import 'category_model.dart';

part 'post_model.g.dart'; // Otomatik oluşturulacak dosya

@JsonSerializable()
class Post {
  final String id;
  final String title;
  final String description;
  final String slug;
  final List<String> tags;
  final bool isFeatured;
  final String? cover;
  final String? file;
  final String categoryId;
  final Category? category;
  final DateTime createdAt;
  final DateTime updatedAt;

  Post({
    required this.id,
    required this.title,
    required this.description,
    required this.slug,
    required this.tags,
    this.isFeatured = false, // Varsayılan değer
    this.cover,
    this.file,
    required this.categoryId,
    this.category,
    required this.createdAt,
    required this.updatedAt,
  });

  // JSON'dan nesneye dönüştürme
  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  // Nesneden JSON'a dönüştürme
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
