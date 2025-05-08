import 'package:flutter_app/services/dio_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final response = await dioClient.dio.get('/user');
  return response.data;
});
