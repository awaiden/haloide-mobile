import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

final bottomNavProvider = StateNotifierProvider<BottomNavController, int>(
  (ref) => BottomNavController(),
);

class BottomNavController extends StateNotifier<int> {
  BottomNavController() : super(0) {
    _initCurrentIndex();
  }

  final pages = ['/', '/about', '/profile'];

  void _initCurrentIndex() {
    final initialPage = pages.firstWhere(
      (page) => page == Get.currentRoute,
      orElse: () => '/',
    );
    state = pages.indexOf(initialPage);
  }

  void changeIndex(int index) {
    state = index;
    Get.offNamed(pages[index]);
  }
}

class LandingNavigation extends ConsumerWidget {
  const LandingNavigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavProvider);
    final controller = ref.read(bottomNavProvider.notifier);

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: controller.changeIndex,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
