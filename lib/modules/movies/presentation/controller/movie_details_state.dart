part of 'movie_details_bloc.dart';

class MoviesDetailsStates extends Equatable {
  const MoviesDetailsStates(
      {this.movieDetails = const MovieDetails(
          id: 1,
          genres: [Genres(name: '', id: 1)],
          backdropPath: "?? /kqjL17yufvn90vLyXYpvtyrFfak.jpg",
          title: '',
          overview: '',
          voteAverage: 6.7,
          releaseDate: '',
          runTime: 2),
      this.requestState = RequestState.loading,
      this.movieDetailsMessage = '',
      this.recommendations = const [],
      this.recommendationRequestState = RequestState.loading,
      this.recommendationsMessage = ''});
  final MovieDetails movieDetails;
  final RequestState requestState;
  final String movieDetailsMessage;
  final List<Recommendations> recommendations;
  final RequestState recommendationRequestState;
  final String recommendationsMessage;
  @override
  List<Object?> get props => [
        movieDetails,
        movieDetailsMessage,
        recommendationRequestState,
        recommendations,
        recommendationsMessage,
        requestState
      ];

  MoviesDetailsStates copyWith(
      {MovieDetails? movieDetails,
      RequestState? requestState,
      String? movieDetailsMessage,
      List<Recommendations>? recommendations,
      RequestState? recommendationRequestState,
      String? recommendationsMessage}) {
    return MoviesDetailsStates(
        movieDetails: movieDetails ?? this.movieDetails,
        movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
        requestState: requestState ?? this.requestState,
        recommendations: recommendations ?? this.recommendations,
        recommendationsMessage:
            recommendationsMessage ?? this.recommendationsMessage,
        recommendationRequestState:
            recommendationRequestState ?? this.recommendationRequestState);
  }
}
