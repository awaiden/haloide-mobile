import 'package:flutter/material.dart';
import 'package:flutter_app/components/post_card.dart';
import 'package:flutter_app/models/paginated_response.dart';
import 'package:flutter_app/models/post_model.dart';
import 'package:flutter_app/pages/error_page.dart';
import 'package:flutter_app/pages/landing_navigation.dart';
import 'package:flutter_app/providers/posts_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  Widget _buildPostsList(AsyncValue<PaginatedResponse<Post>> postsAsync) {
    return postsAsync.when(
      data: (posts) {
        return ListView.builder(
          itemCount: posts.data.length,
          itemBuilder: (context, index) {
            final post = posts.data[index];
            return PostCard(post: post);
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: ErrorPage.new,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsAsync = ref.watch(postsProvider(null));

    return Scaffold(
      appBar: AppBar(
        title: const Text('HALO Dergisi'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Arama butonuna tıklandığında yapılacak işlemler
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(postsProvider(null));
          },
          child: _buildPostsList(postsAsync),
        ),
      ),

      bottomNavigationBar: LandingNavigation(),
    );
  }
}
