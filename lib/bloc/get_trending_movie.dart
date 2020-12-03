import 'package:moviebox/Models/TrendingMovies/trendingMovieResponse.dart';
import 'package:moviebox/repository/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class TrendingMovieListBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<TrendingMovieResponse> _subject =
      BehaviorSubject<TrendingMovieResponse>();

  gettrendingMovies() async {
    TrendingMovieResponse response = await _repository.getTrendingMovies();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<TrendingMovieResponse> get subject => _subject;
}

final trendingmovielistbloc = TrendingMovieListBloc();
