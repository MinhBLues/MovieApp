class PersonExternal {
  final int id;
  final String facebookId;
  final String instagramId;
  final String twitterId;
  final String imdbId;

  PersonExternal(
      this.id, this.facebookId, this.instagramId, this.twitterId, this.imdbId);

  PersonExternal.fromJSON(Map<String, dynamic> json)
      : id = json["id"],
        facebookId = json["facebook_id"],
        instagramId = json["instagram_id"],
        twitterId = json["twitter_id"],
        imdbId = json["imdb_id"];
}
