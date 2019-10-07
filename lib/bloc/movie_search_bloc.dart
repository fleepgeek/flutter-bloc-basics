import 'dart:async';

import 'package:flutter_bloc_basics/bloc/base_bloc.dart';
import 'package:flutter_bloc_basics/models/movie_model.dart';
import 'package:flutter_bloc_basics/repos/movie_repo.dart';

class MovieSearchBloc implements BaseBloc {
  final movieRepo = MovieRepo();
  final _movieController = StreamController<Movie>();
  final _queryController = StreamController<String>();

  Stream<Movie> get movieStream => _movieController.stream;
  Function(String) get addQuery => _queryController.sink.add;

  MovieSearchBloc() {
    _queryController.stream.listen(fetchMovie);
  }

  void fetchMovie(String name) async {
    final movie = await movieRepo.findMovieByName(name);
    _movieController.sink.add(movie);
  }

  @override
  void dispose() {
    print("Disposing MovieSearchBloc");
    _movieController.close();
    _queryController.close();
  }
}
