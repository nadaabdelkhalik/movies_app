import 'package:equatable/equatable.dart';

class Movies extends Equatable {
  final int id;
  final List<int> genreIds;
  final String backdropPath;
  final String title;
  final String overview;
  final double voteAverage;
  final String releaseDate;

  const Movies({
    required this.id,
    required this.genreIds,
    required this.backdropPath,
    required this.title,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate,
  });

  @override
  List<Object?> get props =>
      [id, genreIds, backdropPath, title, overview, voteAverage];
}
