import 'package:json_annotation/json_annotation.dart';
import 'squad_model.dart';

part 'user_model.g.dart'; // Otomatik oluşturulacak dosya

@JsonSerializable()
class User {
  final String id;
  final String username;
  final String email;
  final String password;
  final String? displayName;
  final String? bio;
  final String? website;
  final String? title;
  final String? avatar;
  final String? squadId;
  final Squad? squad; // İlişkili model, opsiyonel
  final List<Role> roles; // Enum tipinde opsiyonel bir liste
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    this.displayName,
    this.bio,
    this.website,
    this.title,
    this.avatar,
    this.squadId,
    this.squad,
    this.roles = const [Role.USER], // Varsayılan değer
    required this.createdAt,
    required this.updatedAt,
  });

  // JSON'dan nesneye dönüştürme
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  // Nesneden JSON'a dönüştürme
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

enum Role { USER, ADMIN }
