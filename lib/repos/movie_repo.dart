import 'package:flutter_bloc_basics/api/movie_api.dart';
import 'package:flutter_bloc_basics/models/movie_model.dart';

class MovieRepo {
  final movieApi = MovieAPI();

  Future<Movie> findMovieByName(name) => movieApi.findMovie(name);
}
