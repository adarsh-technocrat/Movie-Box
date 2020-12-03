import 'package:moviebox/Models/TrendingMovies/trendingMovie.dart';

class TrendingMovieResponse {
  final List<TrendingMovie> trendingmovies;
  final String error;

  TrendingMovieResponse({this.trendingmovies, this.error});

  TrendingMovieResponse.fromJson(Map<String, dynamic> json)
      : trendingmovies = (json["results"] as List)
            .map((i) => new TrendingMovie.fromJson(i))
            .toList(),
        error = "";

  TrendingMovieResponse.withError(String errorValue)
      : trendingmovies = List(),
        error = errorValue;
}
