import 'dart:async';

import 'package:flutter_bloc_basics/bloc/base_bloc.dart';
import 'package:flutter_bloc_basics/models/movie_model.dart';
import 'package:flutter_bloc_basics/repos/movie_repo.dart';
import 'package:rxdart/rxdart.dart';

class MovieSearchBloc implements BaseBloc {
  static final movieRepo = MovieRepo();
  final _movieController = PublishSubject<Movie>();
  final _queryController = BehaviorSubject<String>();
  // final _queryController = BehaviorSubject<String>.seeded('Inception');

  Observable<Movie> get movieStream => _movieController;
  Function(String) get addQuery => _queryController.sink.add;

  MovieSearchBloc() {
    // _queryController.stream.listen(fetchMovie);
    _queryController.stream
        .distinct()
        .transform(queryToMovie)
        .pipe(_movieController);
  }

  // void fetchMovie(String name) async {
  //   final movie = await movieRepo.findMovieByName(name);
  //   _movieController.sink.add(movie);
  // }

  var queryToMovie = StreamTransformer<String, Movie>.fromHandlers(
      handleData: (query, sink) async {
    final movie = await movieRepo.findMovieByName(query);
    print(movie?.title);
    sink.add(movie);
  });

  @override
  void dispose() async {
    print("Disposing MovieSearchBloc");
    // Empties the Streams
    await _movieController.drain();
    await _queryController.drain();

    // Then closes the Streams
    _movieController.close();
    _queryController.close();
  }
}
