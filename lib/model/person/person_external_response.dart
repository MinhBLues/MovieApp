import 'package:MovieApp/model/person/person_external.dart';

class PersonExternalResponse {
  final PersonExternal personExternal;
  final String error;

  PersonExternalResponse(this.personExternal, this.error);

  PersonExternalResponse.fromJSON(Map<String, dynamic> json)
      : personExternal = new PersonExternal.fromJSON(json),
        error = "";

  PersonExternalResponse.withError(errorValue)
      : personExternal = null,
        error = errorValue;
}
