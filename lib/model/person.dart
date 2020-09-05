class Person {
  final int id;
  final double popularity;
  final String name;
  final String profileImg;
  final String known;
  final int gender;
  final String birthDate;
  final String deathDate;
  final String biography;
  final String placebirth;

  Person(this.id, this.popularity, this.name, this.profileImg, this.known,
      this.birthDate, this.deathDate, this.biography, this.placebirth, this.gender);
  Person.fromJSON(Map<String, dynamic> json)
      : id = json["id"],
        popularity = json["popularity"].toDouble(),
        name = json["name"],
        gender = json["gender"],
        profileImg = json["profile_path"],
        known = json["known_for_department"],
        birthDate = json["birthday"],
        deathDate = json["deathday"],
        biography = json["biography"],
        placebirth = json["place_of_birth"];
}
