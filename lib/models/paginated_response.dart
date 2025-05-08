import 'package:json_annotation/json_annotation.dart';

part 'paginated_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PaginatedResponse<T> {
  final List<T> data;
  final Meta meta;

  PaginatedResponse({required this.data, required this.meta});

  // JSON'dan nesneye dönüştürme
  factory PaginatedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$PaginatedResponseFromJson(json, fromJsonT);

  // Nesneden JSON'a dönüştürme
  Map<String, dynamic> toJson(T Function(Object?) toJsonT) =>
      _$PaginatedResponseToJson(this, toJsonT);
}

@JsonSerializable()
class Meta {
  final int page;
  final int pageCount;
  final int total;

  Meta({required this.page, required this.pageCount, required this.total});

  // JSON'dan nesneye dönüştürme
  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  // Nesneden JSON'a dönüştürme
  Map<String, dynamic> toJson() => _$MetaToJson(this);
}
