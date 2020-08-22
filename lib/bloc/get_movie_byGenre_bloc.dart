import 'package:MovieApp/model/movie_response.dart';
import 'package:MovieApp/repository/reponsitory.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/subjects.dart';

class MoviesListByGenreBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieResponse> _subject =
      BehaviorSubject<MovieResponse>();

  getMoviesByGenre(int id) async {
    MovieResponse response = await _repository.getMovieByGender(id);
    _subject.sink.add(response);
  }

  void drainStreams() {
    _subject.value = null;
  }

  @mustCallSuper
  dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<MovieResponse> get subject => _subject;
}

final moviesByGenreBloc = MoviesListByGenreBloc();
