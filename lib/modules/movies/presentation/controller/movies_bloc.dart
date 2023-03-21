import 'package:bloc/bloc.dart';
import 'package:movies_app/modules/core/utilities/enums.dart';
import 'package:movies_app/modules/movies/domain/usecase/get_popular_movies.dart';
import 'package:movies_app/modules/movies/domain/usecase/get_top_rated_movies.dart';

import '../../domain/usecase/get_now_playing_movies.dart';
import 'movies_states.dart';
import 'movies_events.dart';

class MoviesBloc extends Bloc<MoviesEvents, MoviesStates> {
  final GetNowPlayingMovies getNowPlayingMovies;
  final GetPopularMovies getPopularMovies;
  final GetTopRatedMovies getTopRatedMovies;
  MoviesBloc(
      this.getNowPlayingMovies, this.getPopularMovies, this.getTopRatedMovies)
      : super(
          const MoviesStates(),
        ) {
    on<NowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingMovies.execute();
      result.fold(
        (l) => emit(state.copyWith(
            nowPlayingMoviesMessage: l,
            nowPlayingMoviesRequestState: RequestState.failed)),
        (r) => emit(state.copyWith(
            nowPlayingMovies: r,
            nowPlayingMoviesRequestState: RequestState.succeed)),
      );
    });
    on<PopularMoviesEvent>((event, emit) async {
      final result = await getPopularMovies.execute();
      result.fold(
        (l) => emit(state.copyWith(
            popularMoviesMessage: l,
            popularMoviesRequestState: RequestState.failed)),
        (r) => emit(state.copyWith(
            popularMovies: r, popularMoviesRequestState: RequestState.succeed)),
      );
    });
    on<TopRatedMoviesEvent>((event, emit) async {
      final result = await getTopRatedMovies.execute();
      result.fold(
        (l) => emit(state.copyWith(
            topRatedMoviesMessage: l,
            topRatedMoviesRequestState: RequestState.failed)),
        (r) => emit(state.copyWith(
            topRatedMovies: r,
            topRatedMoviesRequestState: RequestState.succeed)),
      );
    });
  }
}
