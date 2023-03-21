import 'package:dartz/dartz.dart';

import '../entities/movies.dart';
import '../repository/base_movies_repository.dart';

class GetPopularMovies {
  final BaseMoviesRepository repository;

  GetPopularMovies(this.repository);
  Future<Either<String, List<Movies>>> execute() async {
    return await  repository.getPopularMovies() ;
  }
}