class Person {
  final int id;
  final double popularity;
  final String name;
  final String profileImg;
  final String known;
  final Duration birthDate;
  final Duration deathDate;
  final String biography;
  final String placebirth;

  Person(this.id, this.popularity, this.name, this.profileImg, this.known,
      this.birthDate, this.deathDate, this.biography, this.placebirth);
  Person.fromJSON(Map<String, dynamic> json)
      : id = json["id"],
        popularity = json["popularity"].toDouble(),
        name = json["name"],
        profileImg = json["profile_path"],
        known = json["known_for_department"],
        birthDate = json["birthday"],
        deathDate = json["deathday"],
        biography = json["biography"],
        placebirth = json["place_of_birth"];
}
