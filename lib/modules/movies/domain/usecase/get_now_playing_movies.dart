import 'package:dartz/dartz.dart';
import 'package:movies_app/modules/movies/domain/entities/movies.dart';
import 'package:movies_app/modules/movies/domain/repository/base_movies_repository.dart';

class GetNowPlayingMovies {
  final BaseMoviesRepository repository;

  GetNowPlayingMovies({ required this.repository});
  Future<Either<String, List<Movies>>> execute() async {
    return await repository.getNowPlayingMovies();
  }
}
