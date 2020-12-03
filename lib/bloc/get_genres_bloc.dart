import 'package:moviebox/Models/genres_response.dart';
import 'package:moviebox/repository/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class GenresListBlock {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<GenresResponse> _subject =
      BehaviorSubject<GenresResponse>();

  getgenresMovies() async {
    GenresResponse response = await _repository.getGenresSection();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<GenresResponse> get subject => _subject;
}

final genresListBlock = GenresListBlock();
