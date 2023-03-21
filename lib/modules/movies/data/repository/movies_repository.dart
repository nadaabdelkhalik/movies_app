import 'package:dartz/dartz.dart';
import 'package:movies_app/modules/core/error/exceptions.dart';
import 'package:movies_app/modules/movies/domain/entities/movies.dart';

import '../../domain/repository/base_movies_repository.dart';
import '../data_source/base_movies_remote_data_source.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseMoviesRemoteDataSource baseMoviesRemoteDataSource;

  MoviesRepository(this.baseMoviesRemoteDataSource);
  @override
  Future<Either<String, List<Movies>>> getNowPlayingMovies() async {
    final result = await baseMoviesRemoteDataSource.getNowPlayingMovies();
    try {
      return right(result);
    } on ServerException catch (e) {
      return Left(e.errorMessageModel.statusMessage);
    }
  }

  @override
  Future<Either<String, List<Movies>>> getPopularMovies() async {
    final result = await baseMoviesRemoteDataSource.getPopularMovies();
    try {
      return right(result);
    } on ServerException catch (e) {
      return Left(e.errorMessageModel.statusMessage);
    }
  }

  @override
  Future<Either<String, List<Movies>>> getTopRatedMovies() async {
    final result = await baseMoviesRemoteDataSource.getTopRatedMovies();
    try {
      return right(result);
    } on ServerException catch (e) {
      return Left(e.errorMessageModel.statusMessage);
    }
  }
}
