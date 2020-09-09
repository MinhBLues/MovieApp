import 'package:MovieApp/model/person/person_external_response.dart';
import 'package:MovieApp/repository/reponsitory.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

class PersonExternalBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<PersonExternalResponse> _subject =
      new BehaviorSubject<PersonExternalResponse>();

  getPersonExternal(int id) async {
    PersonExternalResponse response = await _repository.getPersonExternal(id);
    _subject.sink.add(response);
  }

  void drainStreams() {
    _subject.value = null;
  }

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<PersonExternalResponse> get subject => _subject;
}

final personExternalBloc = PersonExternalBloc();
