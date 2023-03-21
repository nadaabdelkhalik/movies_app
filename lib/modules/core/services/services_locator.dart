import 'package:get_it/get_it.dart';
import 'package:movies_app/modules/movies/domain/usecase/get_popular_movies.dart';
import 'package:movies_app/modules/movies/domain/usecase/get_top_rated_movies.dart';

import '../../movies/data/data_source/base_movies_remote_data_source.dart';
import '../../movies/data/data_source/movies_remote_data_source.dart';
import '../../movies/data/repository/movies_repository.dart';
import '../../movies/domain/repository/base_movies_repository.dart';
import '../../movies/domain/usecase/get_now_playing_movies.dart';

final sl = GetIt.instance;

void setUp() {
  sl.registerLazySingleton<BaseMoviesRemoteDataSource>(
    () => MoviesRemoteDataSource(),
  );
  sl.registerLazySingleton<BaseMoviesRepository>(
    () => MoviesRepository(sl()),
  );
  sl.registerLazySingleton<GetNowPlayingMovies>(
    () => GetNowPlayingMovies(
      repository: sl(),
    ),
  );
  sl.registerLazySingleton<GetTopRatedMovies>(
    () => GetTopRatedMovies(sl()),
  );
  sl.registerLazySingleton<GetPopularMovies>(() => GetPopularMovies(sl()));
}
