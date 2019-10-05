import 'package:flutter/material.dart';
import 'package:flutter_bloc_basics/ui_widgets/custom_app_bar.dart';

class MovieSearch extends StatefulWidget {
  @override
  _MovieSearchState createState() => _MovieSearchState();
}

class _MovieSearchState extends State<MovieSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(150.0 + MediaQuery.of(context).padding.top),
        child: CustomAppBar(),
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Text('No Movie yet'),
          ),
        ),
      ),
    );
  }
}
