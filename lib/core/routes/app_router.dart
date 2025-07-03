import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../presentation/pages/home/home_page.dart';
import '../../presentation/pages/player/player_page.dart';
import '../../presentation/pages/settings/settings_page.dart';
import '../enums/video_source.dart';

class AppRouter {
  static const String homePath = '/';
  static const String playerPath = '/player';
  static const String settingsPath = '/settings';

  static final GoRouter router = GoRouter(
    initialLocation: homePath,
    debugLogDiagnostics: false,
    routes: [
      GoRoute(
        path: homePath,
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: playerPath,
        name: 'player',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return PlayerPage(
            videoId: extra?['videoId'] ?? '',
            videoSource: extra?['videoSource'] ?? VideoSource.anime,
            videoTitle: extra?['videoTitle'] ?? '',
          );
        },
      ),
      GoRoute(
        path: settingsPath,
        name: 'settings',
        builder: (context, state) => const SettingsPage(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            Text(
              '頁面未找到',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              '路徑: ${state.uri.toString()}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go(homePath),
              child: const Text('返回首頁'),
            ),
          ],
        ),
      ),
    ),
  );
} 