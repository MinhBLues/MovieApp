import 'package:MovieApp/model/cast.dart';

class CastResponse {
  final List<Cast> casts;
  final String error;

  CastResponse(this.casts, this.error);
  CastResponse.fromJSON(Map<String, dynamic> json)
      : casts =
            (json["cast"] as List).map((e) => new Cast.fromJSON(e)).toList(),
        error = "";
  CastResponse.withError(errorValue)
      : error = errorValue,
        casts = List();
}
