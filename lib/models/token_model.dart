import 'package:json_annotation/json_annotation.dart';

part 'token_model.g.dart'; // Otomatik oluşturulacak dosya

@JsonSerializable()
class Token {
  final String id;
  final String userId;
  final String token;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime expiresAt;

  Token({
    required this.id,
    required this.userId,
    required this.token,
    required this.createdAt,
    required this.updatedAt,
    required this.expiresAt,
  });

  // JSON'dan nesneye dönüştürme
  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  // Nesneden JSON'a dönüştürme
  Map<String, dynamic> toJson() => _$TokenToJson(this);
}
