class TrendingTv {
  final int id;
  final String title;

  final String poster;
  final String overview;

  TrendingTv({
    this.id,
    this.title,
    this.poster,
    this.overview,
  });

  TrendingTv.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["name"],
        poster = json["poster_path"],
        overview = json["overview"];
}
