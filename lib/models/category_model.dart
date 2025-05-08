import 'package:json_annotation/json_annotation.dart';
import 'post_model.dart';

part 'category_model.g.dart'; // Otomatik oluşturulacak dosya

@JsonSerializable()
class Category {
  final String id;
  final String title;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<Post> posts;

  Category({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.posts,
  });

  // JSON'dan nesneye dönüştürme
  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  // Nesneden JSON'a dönüştürme
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
