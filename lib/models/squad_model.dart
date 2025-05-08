import 'package:json_annotation/json_annotation.dart';
import 'user_model.dart';

part 'squad_model.g.dart'; // Otomatik oluşturulacak dosya

@JsonSerializable()
class Squad {
  final String id;
  final String name;
  final String description;
  final int order;
  final List<User> users;
  final DateTime createdAt;
  final DateTime updatedAt;

  Squad({
    required this.id,
    required this.name,
    required this.description,
    required this.order,
    required this.users,
    required this.createdAt,
    required this.updatedAt,
  });

  // JSON'dan nesneye dönüştürme
  factory Squad.fromJson(Map<String, dynamic> json) => _$SquadFromJson(json);

  // Nesneden JSON'a dönüştürme
  Map<String, dynamic> toJson() => _$SquadToJson(this);
}
