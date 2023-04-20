import 'package:dartz/dartz.dart';
import 'package:movies_app/modules/movies/domain/entities/movie_details.dart';
import 'package:movies_app/modules/movies/domain/repository/base_movies_repository.dart';

class GetMovieDetails
{
  final BaseMoviesRepository repository;

  GetMovieDetails({ required this.repository});
  Future<Either<String, MovieDetails>> execute(int movieId) async {
    return await repository.getMovieDetails(
      movieId
    );
  }
}