import 'package:MovieApp/model/genre.dart';

class GenreResponse {
  final List<Genre> genres;
  final String error;

  GenreResponse(this.genres, this.error);

  GenreResponse.fromJSON(Map<String, dynamic> json)
      : genres =
            (json["genres"] as List).map((e) => new Genre.fromJSON(e)).toList(),
        error = "";

  GenreResponse.withError(errorValue)
      : genres = List(),
        error = errorValue;
}
