import 'package:flutter_bloc_basics/bloc/friends_bloc.dart';
import 'package:flutter_bloc_basics/bloc/movie_search_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

void setUpLocators() {
  // sl.registerSingleton<MovieSearchBloc>(MovieSearchBloc());
  sl.registerSingleton<FriendsBloc>(FriendsBloc());
  sl.registerLazySingleton<MovieSearchBloc>(() => MovieSearchBloc());
}
