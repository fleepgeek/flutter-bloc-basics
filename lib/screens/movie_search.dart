import 'package:flutter/material.dart';
import 'package:flutter_bloc_basics/bloc/movie_search_bloc.dart';
import 'package:flutter_bloc_basics/models/movie_model.dart';
import 'package:flutter_bloc_basics/ui_widgets/custom_app_bar.dart';
import 'package:flutter_bloc_basics/ui_widgets/movie_detail.dart';

class MovieSearch extends StatefulWidget {
  @override
  _MovieSearchState createState() => _MovieSearchState();
}

class _MovieSearchState extends State<MovieSearch> {
  final movieSearchBloc = MovieSearchBloc();

  @override
  void dispose() {
    movieSearchBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(150.0 + MediaQuery.of(context).padding.top),
        child: CustomAppBar(bloc: movieSearchBloc),
      ),
      body: SafeArea(
        child: Container(
          child: StreamBuilder<Movie>(
              stream: movieSearchBloc.movieStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return MovieDetail(snapshot.data);
                } else {
                  return Center(
                    child: Text('No Movie yet'),
                  );
                }
              }),
        ),
      ),
    );
  }
}
