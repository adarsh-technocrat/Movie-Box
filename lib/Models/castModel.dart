class Cast {
  final int id;
  final String name;
  final String poster;
  final String character;

  Cast({
    this.id,
    this.name,
    this.character,
    this.poster,
  });

  Cast.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        character = json["character"],
        poster = json["profile_path"];
}
