import 'package:MovieApp/model/movie_detail.dart';

class MovieDetailResponse {
  final MovieDetail movieDetail;
  final String error;
  MovieDetailResponse(this.movieDetail, this.error);

  MovieDetailResponse.fromJSON(Map<String, dynamic> json)
      : movieDetail = MovieDetail.fromJSON(json),
        error = "";
  MovieDetailResponse.withError(String errorValue)
      : error = errorValue,
        movieDetail = MovieDetail(null, null, null, null, "", null);
}
