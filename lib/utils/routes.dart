import 'package:flutter/material.dart';
import '../models/song_model.dart';
import '../screens/screens.dart';

class RouteGenerator {
  static const String homePage = '/';
  static const String songScreen = '/song';
  static const String playlistScreen = '/playlist';
  static const String loginScreen = '/login';
  static const String signUpScreen = '/sign_up';
  static const String profileScreen = '/profile';
  static const String favoritesScreen = '/favorite';
  static const String playScreen = '/play';

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case favoritesScreen:
        return MaterialPageRoute(
          builder: (_) => const FavoriteScreen(),
        );
      case playScreen:
        return MaterialPageRoute(
          builder: (_) => const PlayScreen(),
        );
      case profileScreen:
        return MaterialPageRoute(
          builder: (_) => ProfileScreen(),
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
      case loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case signUpScreen:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
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
