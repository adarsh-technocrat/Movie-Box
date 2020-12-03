class Genres {
  final int id;
  final String name;

  Genres(this.id, this.name);

// this is Encoding or you can say Serialization
  Genres.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"];
}
