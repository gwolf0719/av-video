import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

// BLoCs
import '../../presentation/blocs/video/video_bloc.dart';
import '../../presentation/blocs/player/player_bloc.dart';
import '../../presentation/blocs/navigation/navigation_bloc.dart';

// UseCases
import '../../domain/usecases/get_videos_usecase.dart';

// Repositories
import '../../domain/repositories/video_repository.dart';
import '../../data/repositories/video_repository_impl.dart';

// DataSources  
import '../../data/datasources/video_remote_data_source.dart';
import '../../data/datasources/video_local_data_source.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  // External dependencies
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  
  getIt.registerLazySingleton<Dio>(() {
    final dio = Dio();
    dio.options.connectTimeout = const Duration(seconds: 10);
    dio.options.receiveTimeout = const Duration(seconds: 30);
    dio.options.headers = {
      'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
    };
    
    // 添加攔截器
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      logPrint: (obj) => print(obj),
    ));
    
    return dio;
  });

  // DataSources
  getIt.registerLazySingleton<VideoRemoteDataSource>(
    () => VideoRemoteDataSourceImpl(getIt<Dio>()),
  );
  
  getIt.registerLazySingleton<VideoLocalDataSource>(
    () => VideoLocalDataSourceImpl(getIt<SharedPreferences>()),
  );

  // Repositories
  getIt.registerLazySingleton<VideoRepository>(
    () => VideoRepositoryImpl(
      remoteDataSource: getIt<VideoRemoteDataSource>(),
      localDataSource: getIt<VideoLocalDataSource>(),
    ),
  );

  // UseCases
  getIt.registerLazySingleton<GetVideosUseCase>(
    () => GetVideosUseCase(getIt<VideoRepository>()),
  );

  // BLoCs
  getIt.registerFactory<VideoBloc>(
    () => VideoBloc(getVideosUseCase: getIt<GetVideosUseCase>()),
  );
  
  getIt.registerFactory<PlayerBloc>(
    () => PlayerBloc(),
  );
  
  getIt.registerFactory<NavigationBloc>(
    () => NavigationBloc(),
  );
} 