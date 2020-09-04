import 'package:MovieApp/model/person/person_image_response.dart';
import 'package:MovieApp/repository/reponsitory.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

class PersonImageBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<PersonImageResponse> _subject =
      BehaviorSubject<PersonImageResponse>();

  getPersonImage(int id) async {
    PersonImageResponse response = await _repository.getPersonImage(id);
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

  BehaviorSubject<PersonImageResponse> get subject => _subject;
}

final personImageBloc = PersonImageBloc();
