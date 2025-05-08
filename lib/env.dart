import 'package:flutter/foundation.dart';

enum Environment { dev, release }

class EnvConfig {
  static Environment get current =>
      kReleaseMode ? Environment.release : Environment.dev;

  static String get cdnUrl {
    return 'https://cdn.haloidergisi.com';
  }

  static String get baseUrl {
    switch (current) {
      case Environment.dev:
        return 'https://api.haloidergisi.com/api';
      case Environment.release:
        return 'https://api.haloidergisi.com/api';
    }
  }
}
