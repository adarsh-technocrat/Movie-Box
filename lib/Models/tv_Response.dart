import 'package:moviebox/Models/tv_Model.dart';

class TvResponse {
  final List<Tv> todayonAirtv;
  final String error;

  TvResponse({this.todayonAirtv, this.error});

  TvResponse.fromJson(Map<String, dynamic> json)
      : todayonAirtv = (json["results"] as List)
            .map(
              (i) => new Tv.fromJson(i),
            )
            .toList(),
        error = "";

  TvResponse.withError(String errorValue)
      : todayonAirtv = List(),
        error = errorValue;
}
