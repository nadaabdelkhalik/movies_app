import 'package:dio/dio.dart';
import 'package:movies_app/modules/core/error/exceptions.dart';
import 'package:movies_app/modules/core/utilities/constants.dart';
import 'package:movies_app/modules/movies/data/models/movie_details_model.dart';
import 'package:movies_app/modules/movies/data/models/movies_model.dart';
import 'package:movies_app/modules/movies/data/models/recommendations_model.dart';

import '../../../core/network/error_message_model.dart';
import 'base_movies_remote_data_source.dart';

class MoviesRemoteDataSource extends BaseMoviesRemoteDataSource {
  @override
  Future<List<MoviesModel>> getNowPlayingMovies() async {
    final response = await Dio().get(Constants.getNowPlayingMoviesURL);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data['results'] as List)
          .map((e) => MoviesModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MoviesModel>> getPopularMovies() async {
    final response = await Dio().get(Constants.getPopularMoviesURL);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data['results'] as List)
          .map((e) => MoviesModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MoviesModel>> getTopRatedMovies() async {
    final response = await Dio().get(Constants.getTopRatedMoviesURL);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data['results'] as List)
          .map((e) => MoviesModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(movieId) async {
    final response = await Dio().get(Constants.getMovieDetailsURL(movieId));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendationsModel>> getRecommendations(int movieId) async {
    final response = await Dio().get(Constants.getRecommendationsURL(movieId));
    if (response.statusCode == 200) {
      return List<RecommendationsModel>.from((response.data['results'] as List)
          .map((e) => RecommendationsModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
