import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/modules/core/utilities/enums.dart';
import 'package:movies_app/modules/movies/presentation/controller/movies_bloc.dart';
import 'package:movies_app/modules/movies/presentation/controller/movies_states.dart';
import 'package:movies_app/modules/movies/presentation/screens/movie_detail_screen.dart';

import '../../../core/utilities/constants.dart';

class NowPlaying extends StatelessWidget {
  const NowPlaying({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesStates>(
        buildWhen: (previous, current) =>
            previous.nowPlayingMoviesRequestState !=
            current.nowPlayingMoviesRequestState,
        builder: (context, state) {
          switch (state.nowPlayingMoviesRequestState) {
            case RequestState.loading:
              return SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                width: double.infinity,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            case RequestState.failed:
              return SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                width: double.infinity,
                child: Center(child: Text(state.nowPlayingMoviesMessage)),
              );
            case RequestState.succeed:
              return FadeIn(
                duration: const Duration(milliseconds: 500),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height / 2,
                    viewportFraction: 1.0,
                    onPageChanged: (index, reason) {},
                  ),
                  items: state.nowPlayingMovies.map(
                    (item) {
                      return GestureDetector(
                        key: const Key('openMovieMinimalDetail'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MovieDetailScreen(
                                        id: item.id,
                                      )));
                        },
                        child: Stack(
                          children: [
                            ShaderMask(
                              shaderCallback: (rect) {
                                return const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.blue,
                                    Colors.blue,
                                    Colors.transparent,
                                  ],
                                  stops: [0, 0.3, 0.5, 1],
                                ).createShader(
                                  Rect.fromLTRB(0, 0, rect.width, rect.height),
                                );
                              },
                              blendMode: BlendMode.dstIn,
                              child: CachedNetworkImage(
                                height: MediaQuery.of(context).size.height / 2,
                                imageUrl:
                                    "${Constants.imageBaseURL}${item.backdropPath}",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 16.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.circle,
                                          color: Colors.white,
                                          size: 16.0,
                                        ),
                                        const SizedBox(width: 4.0),
                                        Text(
                                          'Now Playing'.toUpperCase(),
                                          style: const TextStyle(
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 16.0),
                                    child: Text(
                                      item.title,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ).toList(),
                ),
              );
          }
        });
  }
}
