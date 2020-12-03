import 'package:moviebox/Models/castModel.dart';

class CastResponse {
  final List<Cast> genres;
  final String errors;

  CastResponse(this.genres, this.errors);

  CastResponse.fromJson(Map<String, dynamic> json)
      : genres =
            (json["cast"] as List).map((i) => new Cast.fromJson(i)).toList(),
        errors = "";

  CastResponse.withError(String errorValue)
      : genres = List(),
        errors = errorValue;
}
