import 'package:MovieApp/model/movie.dart';

class MovieResponse {
  final List<Movie> movies;
  final String error;
  MovieResponse(this.movies, this.error);

  MovieResponse.fromJSON(Map<String, dynamic> json)
      : movies = (json["results"] as List)
            .map((e) => new Movie.fromJSON(e))
            .toList(),
        error = "";
  MovieResponse.withError(String errorValue)
      : movies = List(),
        error = errorValue;
}
