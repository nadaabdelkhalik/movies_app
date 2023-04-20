import 'package:movies_app/modules/movies/data/models/recommendations_model.dart';


import '../models/movie_details_model.dart';
import '../models/movies_model.dart';

abstract class BaseMoviesRemoteDataSource {
  Future<List<MoviesModel>> getNowPlayingMovies();
  Future<List<MoviesModel>> getPopularMovies();
  Future<List<MoviesModel>> getTopRatedMovies();
    Future<MovieDetailsModel> getMovieDetails(int movieId);
    Future<List<RecommendationsModel>> getRecommendations(int movieId);
    
}
