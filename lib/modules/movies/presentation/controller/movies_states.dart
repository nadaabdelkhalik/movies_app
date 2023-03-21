import 'package:equatable/equatable.dart';
import 'package:movies_app/modules/core/utilities/enums.dart';
import 'package:movies_app/modules/movies/domain/entities/movies.dart';

class MoviesStates extends Equatable {
  final List<Movies> nowPlayingMovies;
  final String nowPlayingMoviesMessage;
  final RequestState nowPlayingMoviesRequestState;

  const MoviesStates(
      {required this.nowPlayingMovies,
      required this.nowPlayingMoviesMessage,
      required this.nowPlayingMoviesRequestState});
  @override
  List<Object?> get props =>
      [nowPlayingMovies, nowPlayingMoviesMessage, nowPlayingMoviesRequestState];
}
