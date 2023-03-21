import 'package:dartz/dartz.dart';
import 'package:movies_app/modules/movies/domain/entities/movies.dart';

abstract class BaseMoviesRepository {
  Future<Either<String, List<Movies>>> getNowPlayingMovies();
  Future<Either<String, List<Movies>>> getPopularMovies();
  Future<Either<String, List<Movies>>> getTopRatedMovies();
}
