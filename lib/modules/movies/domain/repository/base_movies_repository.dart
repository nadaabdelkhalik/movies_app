import 'package:dartz/dartz.dart';
import 'package:movies_app/modules/movies/domain/entities/movie_details.dart';
import 'package:movies_app/modules/movies/domain/entities/movies.dart';
import 'package:movies_app/modules/movies/domain/entities/recommendations.dart';

abstract class BaseMoviesRepository {
  Future<Either<String, List<Movies>>> getNowPlayingMovies();
  Future<Either<String, List<Movies>>> getPopularMovies();
  Future<Either<String, List<Movies>>> getTopRatedMovies();
  Future<Either<String, MovieDetails>> getMovieDetails(int movieId);
  Future<Either<String,List< Recommendations>>> getRecommendations(int movieId);
}
