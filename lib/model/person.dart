class Person {
  final int id;
  final double popularity;
  final String name;
  final String profileImag;
  final String known;

  Person(this.id, this.popularity, this.name, this.profileImag, this.known);
  Person.fromJSON(Map<String, dynamic> json)
      : id = json["id"],
        popularity = json["popularity"].toDouble(),
        name = json["name"],
        profileImag = json["profile_path"],
        known = json["known_for_department"];
}
