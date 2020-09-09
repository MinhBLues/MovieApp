import 'package:MovieApp/model/cast_response.dart';
import 'package:MovieApp/model/genre_response.dart';
import 'package:MovieApp/model/movie_detail_response.dart';
import 'package:MovieApp/model/movie_response.dart';
import 'package:MovieApp/model/person/person_external_response.dart';
import 'package:MovieApp/model/person/person_image_response.dart';
import 'package:MovieApp/model/person_detail_responese.dart';
import 'package:MovieApp/model/person_response.dart';
import 'package:MovieApp/model/video_response.dart';
import 'package:dio/dio.dart';

class MovieRepository {
  final String apikey = "334a95c5c0a0bd16d17bd835ab69a5ef";
  final language = "vi-Vietnamese";
  static String mainUrl = "https://api.themoviedb.org/3";
  final Dio _dio = Dio();
  var getPopularUrl = '$mainUrl/movie/top_rated';
  var getMoviesUrl = '$mainUrl/discover/movie';
  var getPlayingUrl = '$mainUrl/movie/now_playing';
  var getGenresUrl = '$mainUrl/genre/movie/list';
  var getPersonsUrl = '$mainUrl/person';
  var getMovieDetailUrl = '$mainUrl/movie';

  Future<MovieResponse> getMovies() async {
    var params = {"api_key": apikey, "language": language, "page": 1};

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
    var params = {"api_key": apikey, "language": language, "page:": 1};

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
    var params = {"api_key": apikey, "language": language, "page:": 1};

    try {
      Response response = await _dio.get(getGenresUrl, queryParameters: params);
      return GenreResponse.fromJSON(response.data);
    } catch (error, stacktrace) {
      print("$error , $stacktrace");
      return GenreResponse.withError("$error");
    }
  }

  Future<PersonResponse> getPersons() async {
    var params = {"api_key": apikey, "language": language, "page:": 1};
    try {
      Response response =
          await _dio.get(getPersonsUrl + "/popular", queryParameters: params);
      return PersonResponse.fromJSON(response.data);
    } catch (error, stacktrace) {
      print("$error , $stacktrace");
      return PersonResponse.withError("$error");
    }
  }

  Future<MovieResponse> getMovieByGender(int id) async {
    var params = {
      "api_key": apikey,
      "language": language,
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

  Future<MovieDetailResponse> getMovieDetail(int id) async {
    var params = {"api_key": apikey, "language": language};
    try {
      Response response =
          await _dio.get(getMovieDetailUrl + "/$id", queryParameters: params);
      return MovieDetailResponse.fromJSON(response.data);
    } catch (error, stacktrace) {
      print("$error , $stacktrace");
      return MovieDetailResponse.withError("$error");
    }
  }

  Future<CastResponse> getCasts(int id) async {
    var params = {"api_key": apikey, "language": language};
    try {
      Response response = await _dio.get(
          getMovieDetailUrl + "/$id" + "/credits",
          queryParameters: params);
      return CastResponse.fromJSON(response.data);
    } catch (error, stacktrace) {
      print("$error , $stacktrace");
      return CastResponse.withError("$error");
    }
  }

  Future<MovieResponse> getSimilarMovies(int id) async {
    var params = {"api_key": apikey, "language": language};
    try {
      Response response = await _dio.get(
          getMovieDetailUrl + "/$id" + "/similar",
          queryParameters: params);
      return MovieResponse.fromJSON(response.data);
    } catch (error, stacktrace) {
      print("$error , $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<VideoResponse> getMovieVideos(int id) async {
    var params = {"api_key": apikey, "language": language};
    try {
      Response response = await _dio.get(getMovieDetailUrl + "/$id" + "/videos",
          queryParameters: params);
      return VideoResponse.fromJSON(response.data);
    } catch (error, stacktrace) {
      print("$error , $stacktrace");
      return VideoResponse.withError("$error");
    }
  }

  Future<PersonImageResponse> getPersonImage(int id) async {
    var params = {"api_key": apikey};
    try {
      Response response = await _dio.get(getPersonsUrl + "/$id" + "/images",
          queryParameters: params);
      return PersonImageResponse.fromJSON(response.data);
    } catch (error, stacktrace) {
      print("$error , $stacktrace");
      return PersonImageResponse.withError("$error");
    }
  }

  Future<PersonDetailResponse> getPersonDetail(int id) async {
    var params = {"api_key": apikey, "language": "en-US"};
    try {
      Response response =
          await _dio.get(getPersonsUrl + "/$id", queryParameters: params);
      return PersonDetailResponse.fromJSON(response.data);
    } catch (error, stacktrace) {
      print("$error , $stacktrace");
      return PersonDetailResponse.withError("$error");
    }
  }
  Future<PersonExternalResponse> getPersonExternal(int id) async {
    var params = {"api_key": apikey, "language": language};
    try {
      Response response =
          await _dio.get(getPersonsUrl + "/$id/external_ids", queryParameters: params);
      return PersonExternalResponse.fromJSON(response.data);
    } catch (error, stacktrace) {
      print("$error , $stacktrace");
      return PersonExternalResponse.withError("$error");
    }
  }
}
