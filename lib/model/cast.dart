class Cast {
  final int id;
  final String character;
  final String name;
  final String img;
  final int personId;
  Cast(this.id, this.character, this.name, this.img, this.personId);

  Cast.fromJSON(Map<String, dynamic> json)
      : id = json["cast_id"],
        personId = json["id"],
        character = json["character"],
        name = json["name"],
        img = json["profile_path"];
}
