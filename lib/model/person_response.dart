import 'package:MovieApp/model/person.dart';

class PersonResponse {
  final List<Person> persons;
  final String error;
  PersonResponse(this.persons, this.error);
  PersonResponse.fromJSON(Map<String, dynamic> json)
      : persons = (json["results"] as List)
            .map((e) => new Person.fromJSON(e))
            .toList(),
        error = "";
  PersonResponse.withError(String errorValue)
      : persons = List(),
        error = errorValue;
}
