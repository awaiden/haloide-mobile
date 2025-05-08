import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart'; // Otomatik oluşturulacak dosya

@JsonSerializable()
class News {
  final String id;
  final String slug;
  final String title;
  final String description;
  final String featuredImage;
  final List<String> files;
  final List<String> tags;
  final DateTime createdAt;
  final DateTime updatedAt;

  News({
    required this.id,
    required this.slug,
    required this.title,
    required this.description,
    required this.featuredImage,
    required this.files,
    required this.tags,
    required this.createdAt,
    required this.updatedAt,
  });

  // JSON'dan nesneye dönüştürme
  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  // Nesneden JSON'a dönüştürme
  Map<String, dynamic> toJson() => _$NewsToJson(this);
}
