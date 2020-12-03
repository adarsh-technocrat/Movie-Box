import 'package:dio/dio.dart';
import 'package:moviebox/Models/TrendingMovies/trendingMovieResponse.dart';
import 'package:moviebox/Models/TrendingTv/trendingTvResponse.dart';
import 'package:moviebox/Models/genres_response.dart';
import 'package:moviebox/Models/movie_response.dart';

import 'package:moviebox/Models/tv_Response.dart';

class MovieRepository {
  final String apikey = "21e55a771194347aab6fd388e8e0d0f6";
  static String baseURL = "https://api.themoviedb.org/3";

  final Dio _dio = Dio();

  var getPopularUrl = "$baseURL/movie/top_rated";
  var getmovieUrl = "$baseURL/discover/movie";
  var getGenresUrl = "$baseURL/genre/movie/list";
  var getcastUrl = "$baseURL/movie/top_rated";
  var getPlayingUrl = "$baseURL/movie/now_playing";
  var getTrendingmoviesUrl = "$baseURL/trending/movie/week";
  var getTrendingTvUrl = "$baseURL/trending/tv/day";
  var getTvOnAirTodayUrl = "$baseURL/tv/airing_today";
  Future<MovieResponse> getMovies() async {
    var params = {
      "api_key": apikey,
      "language": "en-US",
      "page": 1,
    };
    try {
      Response response =
          await _dio.get(getPopularUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stackTrace) {
      print("Exception occured: $error stackTrace : $stackTrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<MovieResponse> getNowplayingMovies() async {
    var params = {
      "api_key": apikey,
      "language": "en-US",
      "page": 1,
    };
    try {
      Response response =
          await _dio.get(getPlayingUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stackTrace) {
      print("Exception occured: $error stackTrace : $stackTrace");
      return MovieResponse.withError("$error");
    }
  }
  // trending movie Section

  Future<TrendingMovieResponse> getTrendingMovies() async {
    var params = {
      "api_key": apikey,
    };
    try {
      Response response =
          await _dio.get(getTrendingmoviesUrl, queryParameters: params);
      return TrendingMovieResponse.fromJson(response.data);
    } catch (error, stackTrace) {
      print("Exception occured: $error stackTrace : $stackTrace");
      return TrendingMovieResponse.withError("$error");
    }
  }

  // trending tv section
  Future<TrendingTvResponse> getTrendingtv() async {
    var params = {
      "api_key": apikey,
    };
    try {
      Response response =
          await _dio.get(getTvOnAirTodayUrl, queryParameters: params);
      return TrendingTvResponse.fromJson(response.data);
    } catch (error, stackTrace) {
      print("Exception occured: $error stackTrace : $stackTrace");
      return TrendingTvResponse.withError("$error");
    }
  }

  // Todat on Air Tv List
  Future<TvResponse> getTvOnAirToday() async {
    var params = {
      "api_key": apikey,
    };
    try {
      Response response =
          await _dio.get(getTrendingTvUrl, queryParameters: params);
      return TvResponse.fromJson(response.data);
    } catch (error, stackTrace) {
      print("Exception occured: $error stackTrace : $stackTrace");
      return TvResponse.withError("$error");
    }
  }

//genres section
  Future<GenresResponse> getGenresSection() async {
    var params = {
      "api_key": apikey,
      "language": "en-US",
    };
    try {
      Response response = await _dio.get(getGenresUrl, queryParameters: params);
      return GenresResponse.fromJson(response.data);
    } catch (error, stackTrace) {
      print("Exception occured: $error stackTrace : $stackTrace");
      return GenresResponse.withError("$error");
    }
  }

  // get movie by genres
  Future<MovieResponse> getMovieByGenre(int id) async {
    var params = {
      "api_key": apikey,
      "language": "en-US",
      "sort_by": "popularity.desc",
      "page": 1,
      "with_genres": id,
    };
    try {
      Response response = await _dio.get(getmovieUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stackTrace) {
      print("Exception occured: $error stackTrace : $stackTrace");
      return MovieResponse.withError("$error");
    }
  }
}
