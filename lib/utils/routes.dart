import 'package:flutter/material.dart';
import '../models/song_model.dart';
import '../screens/screens.dart';

class RouteGenerator {
  static const String homePage = '/';
  static const String songScreen = '/song';
  static const String playlistScreen = '/playlist';

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case songScreen:
        final song = settings.arguments as Song;
        return MaterialPageRoute(
          builder: (_) => const SongScreen(),
          settings: RouteSettings(
            arguments: song,
          ),
        );
      case playlistScreen:
        return MaterialPageRoute(
          builder: (_) => const PlayListScreen(),
        );
      default:
        throw const FormatException("Route not found");
    }
  }
}

class RouteException implements Exception {
  final String message;
  const RouteException(this.message);
}
