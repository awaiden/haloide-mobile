import 'package:flutter/material.dart';
import 'package:flutter_app/components/image_component.dart';
import 'package:flutter_app/models/post_model.dart';
import 'package:flutter_app/providers/bookmarks_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PostCard extends ConsumerWidget {
  final Post post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmark = ref.watch(bookmarksProvider);

    return InkWell(
      onTap: () {
        Get.toNamed('/posts/${post.slug}');
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 4,
        color: Colors.white,
        shadowColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 8,
            children: [
              if (post.cover != null)
                ImageComponent(
                  imageUrl: post.cover!,
                  height: 80,
                  fit: BoxFit.contain,
                ),
              const SizedBox(height: 8),
              Text(
                post.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                post.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    DateFormat('dd MMMM yyyy').format(post.createdAt),
                    style: const TextStyle(color: Colors.grey),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    spacing: 8,
                    children: [
                      IconButton(
                        onPressed: () {
                          // Handle share action
                        },
                        icon: Icon(Icons.share, color: Colors.grey),
                      ),
                      IconButton(
                        onPressed: () {
                          ref
                              .read(bookmarksProvider.notifier)
                              .toggleBookmark(post.id);
                        },
                        icon: Icon(
                          bookmark.contains(post.id)
                              ? Icons.bookmark
                              : Icons.bookmark_border,
                          color:
                              bookmark.contains(post.id)
                                  ? Colors.blue
                                  : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
