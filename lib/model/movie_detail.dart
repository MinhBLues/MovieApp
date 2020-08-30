import 'package:MovieApp/model/genre.dart';

class MovieDetail {
  final int id;
  final bool adult;
  final int budget;
  final List<Genre> genres;
  final String releaseDate;
  final int runtime;
  MovieDetail(this.id, this.adult, this.budget, this.genres, this.releaseDate,
      this.runtime);
  MovieDetail.fromJSON(Map<String, dynamic> json)
      : id = json["id"],
        adult = json["adult"],
        budget = json["budget"],
        releaseDate = json["release_date"],
        genres =
            (json["genres"] as List).map((e) => new Genre.fromJSON(e)).toList(),
        runtime = json["runtime"];
}
