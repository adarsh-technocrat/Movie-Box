class TrendingMovie {
  final int id;
  final String title;

  final String poster;
  final String overview;

  TrendingMovie({
    this.id,
    this.title,
    this.poster,
    this.overview,
  });

  TrendingMovie.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        poster = json["poster_path"],
        overview = json["overview"];
}
