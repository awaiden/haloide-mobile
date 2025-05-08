import 'package:flutter_app/models/paginated_response.dart';
import 'package:flutter_app/models/post_model.dart';
import 'package:flutter_app/services/dio_client.dart';
import 'package:riverpod/riverpod.dart';

final postsProvider = FutureProvider.family<
  PaginatedResponse<Post>,
  Map<String, dynamic>?
>((ref, queryParams) async {
  final response = await dioClient.dio.get(
    '/posts',
    queryParameters: queryParams, // Opsiyonel parametreleri buraya geçiyoruz
  );

  final data = PaginatedResponse<Post>.fromJson(
    response.data,
    (json) => Post.fromJson(json as Map<String, dynamic>),
  );

  return data;
});

final postProvider = FutureProvider.family<Post, String>((ref, id) async {
  final response = await dioClient.dio.get('/posts/$id');
  return Post.fromJson(response.data);
});
