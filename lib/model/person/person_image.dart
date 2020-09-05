class PersonImage {
  final int id;
  final List<String> images;

  PersonImage(this.id, this.images);

  PersonImage.fromJSON(Map<String, dynamic> json)
      : id = json["id"],
        images = (json["profiles"] as List).map((json) => json["file_path"].toString()).toList();
}
