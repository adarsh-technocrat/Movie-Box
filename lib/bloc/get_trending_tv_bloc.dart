import 'package:moviebox/Models/TrendingTv/trendingTvResponse.dart';
import 'package:moviebox/repository/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class TrendingTvListBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<TrendingTvResponse> _subject =
      BehaviorSubject<TrendingTvResponse>();

  gettrendingTv() async {
    TrendingTvResponse response = await _repository.getTrendingtv();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<TrendingTvResponse> get subject => _subject;
}

final trendingtvlistbloc = TrendingTvListBloc();
