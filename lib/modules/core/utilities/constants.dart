import 'package:flutter/material.dart';

class Constants {
  static String baseURL = 'https://api.themoviedb.org/3/';
  static String apiKey = '6b559e6717e487fbd07ab24b0238a992';
  static String getNowPlayingMoviesURL =
      '${baseURL}movie/now_playing?api_key=$apiKey';
  static String getPopularMoviesURL = '${baseURL}movie/upcoming?api_key=$apiKey';
  static String getTopRatedMoviesURL =
      '${baseURL}movie/top_rated?api_key=$apiKey';
  static String imageBaseURL = 'https://image.tmdb.org/t/p/w500';
  static Color primaryColor = const Color.fromARGB(255, 3, 37, 85);
}
