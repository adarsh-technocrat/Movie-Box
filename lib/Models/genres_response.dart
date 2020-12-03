import 'package:moviebox/Models/genresModel.dart';

class GenresResponse {
  final List<Genres> genres;
  final String errors;

  GenresResponse(this.genres, this.errors);

  GenresResponse.fromJson(Map<String, dynamic> json)
      : genres = (json["genres"] as List)
            .map((i) => new Genres.fromJson(i))
            .toList(),
        errors = "";

  GenresResponse.withError(String errorValue)
      : genres = List(),
        errors = errorValue;
}
