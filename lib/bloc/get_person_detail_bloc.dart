import 'package:MovieApp/model/person_detail_responese.dart';
import 'package:MovieApp/model/person_response.dart';
import 'package:MovieApp/repository/reponsitory.dart';
import 'package:rxdart/subjects.dart';

class PersonDetailBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<PersonDetailResponse> _subject =
      BehaviorSubject<PersonDetailResponse>();

  getPersonDetail(int id) async {
    PersonDetailResponse response = await _repository.getPersonDetail(id);
    _subject.sink.add(response);
  }

    void drainStreams() {
    _subject.value = null;
  }

  BehaviorSubject<PersonDetailResponse> get subject => _subject;
}

final personDetailBloc = PersonDetailBloc();
