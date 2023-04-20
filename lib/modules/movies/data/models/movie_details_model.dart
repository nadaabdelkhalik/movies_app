import 'package:movies_app/modules/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.id,
    required super.backdropPath,
    required super.title,
    required super.overview,
    required super.voteAverage,
    required super.releaseDate,
    required super.runTime,
    required super.genres,
  });
  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      id: json['id'],
      backdropPath: json['backdrop_path'],
      title: json['title'],
      overview: json['overview'],
      voteAverage: json["vote_average"].toDouble(),
      releaseDate: json["release_date"],
      runTime: json['runtime'],
      genres: List<GenresModel>.from(
        json["genres"].map(
          (e) => GenresModel.fromJson(e),
        ),
      ),
    );
  }
}

class GenresModel extends Genres {
  const GenresModel({required super.name, required super.id});
  factory GenresModel.fromJson(Map<String, dynamic> json) {
    return GenresModel(name: json['name'], id: json['id']);
  }
}
