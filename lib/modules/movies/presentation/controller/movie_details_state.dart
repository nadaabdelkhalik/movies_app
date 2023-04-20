part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  const MovieDetailsState(
      {this.movieDetails,
      this.requestState = RequestState.loading,
      this.movieDetailsMessage = ''});
  final MovieDetails? movieDetails;
  final RequestState requestState;
  final String movieDetailsMessage;

  @override
  List<Object>get props => [movieDetailsMessage, requestState,];

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestState? requestState,
    String? movieDetailsMessage,
  }) {
    return MovieDetailsState(
        movieDetails: movieDetails ?? this.movieDetails,
        movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
        requestState: requestState ?? this.requestState);
  }
}

class RecommendationsState extends Equatable {
  const RecommendationsState(
      {this.recommendations = const [],
      this.recommendationRequestState = RequestState.loading,
      this.recommendationsMessage = ''});
  final List<Recommendations> recommendations;
  final RequestState recommendationRequestState;
  final String recommendationsMessage;

  @override
  List<Object> get props =>
      [recommendationsMessage, recommendationRequestState, recommendations];

  RecommendationsState copyWith(
      {List<Recommendations>? recommendations,
      RequestState? recommendationRequestState,
      String? recommendationsMessage}) {
    return RecommendationsState(
        recommendations: recommendations ?? this.recommendations,
        recommendationsMessage:
            recommendationsMessage ?? this.recommendationsMessage,
        recommendationRequestState:
            recommendationRequestState ?? this.recommendationRequestState);
  }
}
