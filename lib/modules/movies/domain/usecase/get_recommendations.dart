import 'package:dartz/dartz.dart';

import 'package:movies_app/modules/movies/domain/entities/recommendations.dart';

import '../repository/base_movies_repository.dart';

class GetRecommendations {
  final BaseMoviesRepository repository;

  GetRecommendations({required this.repository});
  Future<Either<String, List<Recommendations>>> execute(int movieId) async {
    return await repository.getRecommendations(movieId);
  }
}
