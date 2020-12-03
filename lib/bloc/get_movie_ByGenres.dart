import 'package:flutter/cupertino.dart';
import 'package:moviebox/Models/movie_response.dart';
import 'package:moviebox/repository/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class MovieListByGenereBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieResponse> _subject =
      BehaviorSubject<MovieResponse>();

  getMoviesByGenre(int id) async {
    MovieResponse response = await _repository.getMovieByGenre(id);
    _subject.sink.add(response);
  }

  void drainStrean() {
    _subject.value = null;
  }

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
  }

  BehaviorSubject<MovieResponse> get subject => _subject;
}

final getmovieByGeners = MovieListByGenereBloc();
