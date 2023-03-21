import 'package:bloc/bloc.dart';
import 'package:movies_app/modules/core/utilities/enums.dart';

import '../../domain/usecase/get_now_playing_movies.dart';
import 'movies_states.dart';
import 'movies_events.dart';

class MoviesBloc extends Bloc<MoviesEvents, MoviesStates> {
  final GetNowPlayingMovies getNowPlayingMovies;
  MoviesBloc(this.getNowPlayingMovies)
      : super(
          const MoviesStates(
              nowPlayingMovies: [],
              nowPlayingMoviesMessage: '',
              nowPlayingMoviesRequestState: RequestState.loading),
        ) {
    on<NowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingMovies.execute();
      result.fold(
        (l) => emit(MoviesStates(
            nowPlayingMovies: const [],
            nowPlayingMoviesMessage: l,
            nowPlayingMoviesRequestState: RequestState.failed)),
        (r) => emit(MoviesStates(
            nowPlayingMovies: r,
            nowPlayingMoviesMessage: '',
            nowPlayingMoviesRequestState: RequestState.succeed)),
      );
    });
  }
}
