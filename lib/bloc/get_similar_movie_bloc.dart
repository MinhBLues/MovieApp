import 'package:MovieApp/model/movie_response.dart';
import 'package:MovieApp/repository/reponsitory.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

class MovieSimilarBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieResponse> _subject =
      BehaviorSubject<MovieResponse>();

  getMovies(int id) async {
    MovieResponse response = await _repository.getSimilarMovies(id);
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

  BehaviorSubject<MovieResponse> get subject => _subject;
}

final movieSimilarBloc = MovieSimilarBloc();
