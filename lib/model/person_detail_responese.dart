import 'package:MovieApp/model/person.dart';

class PersonDetailResponse {
  final Person person;
  final String error;
  PersonDetailResponse(this.person, this.error);
  PersonDetailResponse.fromJSON(Map<String, dynamic> json)
      : person = new Person.fromJSON(json),
        error = "";
  PersonDetailResponse.withError(String errorValue)
      : person = null,
        error = errorValue;
}
