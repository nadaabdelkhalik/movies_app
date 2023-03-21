import 'package:equatable/equatable.dart';
import 'package:movies_app/modules/core/utilities/enums.dart';
import 'package:movies_app/modules/movies/domain/entities/movies.dart';

class MoviesStates extends Equatable {
  final List<Movies> nowPlayingMovies;
  final String nowPlayingMoviesMessage;
  final RequestState nowPlayingMoviesRequestState;
  final List<Movies> popularMovies;
  final String popularMoviesMessage;
  final RequestState popularMoviesRequestState;
  final List<Movies> topRatedMovies;
  final String topRatedMoviesMessage;
  final RequestState topRatedMoviesRequestState;

  const MoviesStates(
      {this.topRatedMovies = const [],
      this.topRatedMoviesMessage = '',
      this.topRatedMoviesRequestState = RequestState.loading,
      this.popularMovies = const [],
      this.popularMoviesMessage = '',
      this.popularMoviesRequestState = RequestState.loading,
      this.nowPlayingMovies = const [],
      this.nowPlayingMoviesMessage = '',
      this.nowPlayingMoviesRequestState = RequestState.loading});
  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingMoviesMessage,
        nowPlayingMoviesRequestState,
        popularMoviesMessage,
        popularMovies,
        popularMoviesRequestState,
        topRatedMovies,
        topRatedMoviesMessage,
        topRatedMoviesRequestState
      ];

  MoviesStates copyWith({
    List<Movies>? nowPlayingMovies,
    String? nowPlayingMoviesMessage,
    RequestState? nowPlayingMoviesRequestState,
    List<Movies>? popularMovies,
    String? popularMoviesMessage,
    RequestState? popularMoviesRequestState,
    List<Movies>? topRatedMovies,
    String? topRatedMoviesMessage,
    RequestState? topRatedMoviesRequestState,
  }) {
    return MoviesStates(
        nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
        nowPlayingMoviesMessage:
            nowPlayingMoviesMessage ?? this.nowPlayingMoviesMessage,
        nowPlayingMoviesRequestState:
            nowPlayingMoviesRequestState ?? this.nowPlayingMoviesRequestState,
        popularMovies: popularMovies ?? this.popularMovies,
        popularMoviesMessage: popularMoviesMessage ?? this.popularMoviesMessage,
        popularMoviesRequestState:
            popularMoviesRequestState ?? this.popularMoviesRequestState,
        topRatedMovies: topRatedMovies ?? this.topRatedMovies,
        topRatedMoviesMessage:
            topRatedMoviesMessage ?? this.topRatedMoviesMessage,
        topRatedMoviesRequestState:
            topRatedMoviesRequestState ?? this.topRatedMoviesRequestState);
  }
}
