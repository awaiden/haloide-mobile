import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

class BookmarksProvider extends StateNotifier<List<String>> {
  static const _storageKey = 'bookmarks';
  final GetStorage _storage = GetStorage();

  BookmarksProvider() : super([]) {
    final savedBookmarks = _storage.read<List<dynamic>>(_storageKey);
    if (savedBookmarks != null) {
      state = savedBookmarks.cast<String>();
    }
  }

  void _saveToStorage() {
    _storage.write(_storageKey, state);
  }

  void addBookmark(String postId) {
    if (!state.contains(postId)) {
      state = [...state, postId];
      _saveToStorage();
    }
  }

  void removeBookmark(String postId) {
    state = state.where((id) => id != postId).toList();
    _saveToStorage();
  }

  bool isBookmarked(String postId) {
    return state.contains(postId);
  }

  void toggleBookmark(String postId) {
    if (isBookmarked(postId)) {
      removeBookmark(postId);
    } else {
      addBookmark(postId);
    }
  }
}

final bookmarksProvider =
    StateNotifierProvider<BookmarksProvider, List<String>>(
      (ref) => BookmarksProvider(),
    );
