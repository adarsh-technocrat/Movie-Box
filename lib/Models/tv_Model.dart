class Tv {
  final int id;
  final String title;
  final String poster;
  final String backPoster;
  final String overview;

  Tv({
    this.id,
    this.title,
    this.poster,
    this.backPoster,
    this.overview,
  });

  Tv.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["name"],
        poster = json["poster_path"],
        backPoster = json["backdrop_path"],
        overview = json["overview"];
}
