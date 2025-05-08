import 'package:flutter/material.dart';
import 'package:flutter_app/components/image_component.dart';
import 'package:flutter_app/components/styled_button.dart';
import 'package:flutter_app/models/post_model.dart';
import 'package:flutter_app/pages/error_page.dart';
import 'package:flutter_app/providers/bookmarks_provider.dart';
import 'package:flutter_app/providers/posts_provider.dart';
import 'package:flutter_app/services/dio_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PostViewPage extends ConsumerWidget {
  const PostViewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postId = Get.parameters['postId'];
    final postAsync = ref.watch(postProvider(postId!));

    final bookmarks = ref.watch(bookmarksProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gönderi Detayı'),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // Paylaşım butonuna tıklandığında yapılacak işlemler
            },
          ),
          IconButton(
            icon: Icon(
              bookmarks.contains(postId)
                  ? Icons.bookmark
                  : Icons.bookmark_border,
              color: bookmarks.contains(postId) ? Colors.blue : null,
            ),
            onPressed: () {
              ref.read(bookmarksProvider.notifier).toggleBookmark(postId);
            },
          ),
        ],
      ),
      body: postAsync.when(
        data: (post) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16,
              children: [
                ImageComponent(imageUrl: post.cover!, fit: BoxFit.contain),
                Text(
                  post.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(post.description),
                Text(
                  'Yayınlanma Tarihi: ${DateFormat('dd MMMM yyyy').format(post.createdAt)}',
                  style: const TextStyle(color: Colors.grey),
                ),
                StyledButton(
                  onPressed: () {
                    if (post.file != null) {
                      Get.to(() => ViewAsPdf(post: post));
                    } else {
                      Get.snackbar('Hata', 'PDF dosyası bulunamadı.');
                    }
                  },
                  type: ButtonType.primary,
                  size: ButtonSize.large,
                  child: Text('Dergiyi Oku'),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: ErrorPage.new,
      ),
    );
  }
}

class ViewAsPdf extends StatelessWidget {
  final Post post;

  const ViewAsPdf({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SfPdfViewer.network(dioClient.getFileUrl(post.file!)),
    );
  }
}
