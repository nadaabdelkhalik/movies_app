import 'package:equatable/equatable.dart';

abstract class MovieDetailsEvent extends Equatable {}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int movieId;
  GetMovieDetailsEvent({required this.movieId});

  @override
  List<Object?> get props => [movieId];
}

class GetRecommendationsEvent extends MovieDetailsEvent {
  final int movieId;

  GetRecommendationsEvent({required this.movieId});
  @override
  List<Object?> get props => [movieId];
}
