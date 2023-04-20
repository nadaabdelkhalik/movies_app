import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/modules/core/utilities/enums.dart';
import 'package:movies_app/modules/movies/domain/entities/movie_details.dart';
import 'package:movies_app/modules/movies/domain/entities/recommendations.dart';
import 'package:movies_app/modules/movies/domain/usecase/get_movie_details.dart';

import '../../domain/usecase/get_recommendations.dart';
import 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<dynamic, dynamic> {
  final GetMovieDetails getMovieDetails;
   final GetRecommendations getRecommendations;
   
  MovieDetailsBloc(this.getMovieDetails, this.getRecommendations) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>((event, emit) async {
      final result = await getMovieDetails.execute(event.movieId);
      result.fold(
        (l) => emit(state.copyWith(
            movieDetailsMessage: l, requestState: RequestState.failed)),
        (r) => emit(state.copyWith(
            movieDetails: r, requestState: RequestState.succeed)),
      );
    });
     on<GetRecommendationsEvent>((event, emit) async {
      final result = await getRecommendations.execute(event.movieId);
      result.fold(
        (l) => emit(state.copyWith(
          recommendationRequestState:RequestState.failed,
          recommendationsMessage: l
            )),
        (r) => emit(state.copyWith(
            recommendations: r, recommendationRequestState: RequestState.succeed)),
      );
    });
  }
}
