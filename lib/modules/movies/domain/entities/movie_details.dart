import 'package:equatable/equatable.dart';

class MovieDetails extends Equatable {
  final int id;

  final String backdropPath;
  final String title;
    final List<Genres> genres;
  final String overview;
  final double voteAverage;
  final String releaseDate;
  final int runTime;

  const MovieDetails(
      {required this.id,
      required this.genres,
      required this.backdropPath,
      required this.title,
      required this.overview,
      required this.voteAverage,
      required this.releaseDate,
      required this.runTime});

  @override
  List<Object?> get props => [
        id,
        backdropPath,
        title,
        overview,
        voteAverage,
        releaseDate,
        runTime,
        genres
      ];
}

class Genres extends Equatable {
  final String name;
  final int id;

  const Genres({required this.name, required this.id});
  @override
  List<Object?> get props => [name, id];
}
