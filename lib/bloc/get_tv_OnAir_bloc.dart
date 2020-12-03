import 'package:moviebox/repository/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:moviebox/Models/tv_Response.dart';

class TvTodayonAirList {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<TvResponse> _subject = BehaviorSubject<TvResponse>();

  getTvOnAitTodat() async {
    TvResponse response = await _repository.getTvOnAirToday();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<TvResponse> get subject => _subject;
}

final tvTodatOnAir = TvTodayonAirList();
