import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'core/di/injection_container.dart';
import 'core/theme/app_theme.dart';
import 'core/routes/app_router.dart';
import 'core/utils/platform_utils.dart';
import 'presentation/blocs/video/video_bloc.dart';
import 'presentation/blocs/player/player_bloc.dart';
import 'presentation/blocs/navigation/navigation_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // 初始化依賴注入
  await configureDependencies();
  
  // 設定系統UI
  await _configureSystemUI();
  
  runApp(const AVTVApp());
}

Future<void> _configureSystemUI() async {
  // 設定狀態列
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  
  // TV模式下隱藏狀態列
  if (PlatformUtils.isTV) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }
}

class AVTVApp extends StatelessWidget {
  const AVTVApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<VideoBloc>(
          create: (context) => getIt<VideoBloc>(),
        ),
        BlocProvider<PlayerBloc>(
          create: (context) => getIt<PlayerBloc>(),
        ),
        BlocProvider<NavigationBloc>(
          create: (context) => getIt<NavigationBloc>(),
        ),
      ],
      child: MaterialApp.router(
        title: 'AVTV',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark,
        routerConfig: AppRouter.router,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: 1.0, // 固定字體大小
            ),
            child: child!,
          );
        },
      ),
    );
  }
} 