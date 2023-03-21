import 'package:dartz/dartz.dart';
import 'package:movies_app/modules/movies/domain/entities/movies.dart';
import 'package:movies_app/modules/movies/domain/repository/base_movies_repository.dart';

class GetTopRatedMovies {
  final BaseMoviesRepository repository;

  GetTopRatedMovies(this.repository);
Future<Either<String, List<Movies>>> execute()async
  {
    return await repository.getTopRatedMovies();
  }

}
