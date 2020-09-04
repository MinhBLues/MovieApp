import 'package:MovieApp/model/person/person_image.dart';

class PersonImageResponse {
  final PersonImage personImage;
  final String error;

  PersonImageResponse(this.personImage, this.error);

  PersonImageResponse.fromJSON(Map<String, dynamic> json)
      : personImage = PersonImage.fromJSON(json),
        error = "";
  PersonImageResponse.withError(errorValue)
      : error = errorValue,
        personImage = PersonImage(null, null);
}
