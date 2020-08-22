import 'package:MovieApp/model/genre_response.dart';
import 'package:MovieApp/model/movie_response.dart';
import 'package:MovieApp/model/person_response.dart';
import 'package:dio/dio.dart';

class MovieRepository {
  final String apikey = "334a95c5c0a0bd16d17bd835ab69a5ef";
  static String mainUrl = "https://api.themoviedb.org/3";
  final Dio _dio = Dio();
  var getPopularUrl = '$mainUrl/movie/top_rated';
  var getMoviesUrl = '$mainUrl/discover/movie';
  var getPlayingUrl = '$mainUrl/movie/now_playing';
  var getGenresUrl = '$mainUrl/genre/movie/list';
  var getPersonsUrl = '$mainUrl/trending/person/week';

  Future<MovieResponse> getMovies() async {
    var params = {"api_key": apikey, "language": "vi-Vietnamese", "page": 1};

    try {
      Response response =
          await _dio.get(getPopularUrl, queryParameters: params);
      return MovieResponse.fromJSON(response.data);
    } catch (error, stacktrace) {
      print("$error , $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<MovieResponse> getPlayingMovies() async {
    var params = {"api_key": apikey, "language": "vi-Vietnamese", "page:": 1};

    try {
      Response response =
          await _dio.get(getPlayingUrl, queryParameters: params);
      return MovieResponse.fromJSON(response.data);
    } catch (error, stacktrace) {
      print("$error , $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<GenreResponse> getGenres() async {
    var params = {"api_key": apikey, "language": "vi-Vietnamese", "page:": 1};

    try {
      Response response = await _dio.get(getGenresUrl, queryParameters: params);
      return GenreResponse.fromJSON(response.data);
    } catch (error, stacktrace) {
      print("$error , $stacktrace");
      return GenreResponse.withError("$error");
    }
  }

  Future<PersonResponse> getPersons() async {
    var params = {"api_key": apikey, "language": "vi-Vietnamese", "page:": 1};
    try {
      Response response =
          await _dio.get(getPersonsUrl, queryParameters: params);
      return PersonResponse.fromJSON(response.data);
    } catch (error, stacktrace) {
      print("$error , $stacktrace");
      return PersonResponse.withError("$error");
    }
  }

  Future<MovieResponse> getMovieByGender(int id) async {
    var params = {
      "api_key": apikey,
      "language": "vi-Vietnamese",
      "page:": 1,
      "with_genres": id
    };
    try {
      Response response = await _dio.get(getMoviesUrl, queryParameters: params);
      return MovieResponse.fromJSON(response.data);
    } catch (error, stacktrace) {
      print("$error , $stacktrace");
      return MovieResponse.withError("$error");
    }
  }
}
