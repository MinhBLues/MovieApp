import 'package:MovieApp/model/genre_response.dart';
import 'package:MovieApp/model/movie_response.dart';
import 'package:dio/dio.dart';

class MovieRepository {
  final String apikey = "<<themoviedb.org - ApiKey here>>";
  static String mainUrl = "http://www.themoviedb.org/3";
  final Dio _dio = Dio();
  var getPopularUrl = '$mainUrl/movie/top_rated';
  var getMoviesUrl = '$mainUrl/discover/movie';
  var getPlayingUrl = '$mainUrl/movie/now_playing';
  var getGenresUrl = '$mainUrl/genre/movie/list';
  var getPersonsUrl = '$mainUrl/trending/person/week';

  Future<MovieResponse> getMovies() async {
    var params = {"api_key": apikey, "language": "en-US", "page:": 1};

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
    var params = {"api_key": apikey, "language": "en-US", "page:": 1};
  }
}
