import 'package:flutter/material.dart';
import 'package:flutter_bloc_basics/screens/friend_list.dart';
import 'package:flutter_bloc_basics/screens/movie_search.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BLoC Demystified',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  void navigateTo(context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter BLoC Demystified'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Friend List'),
              onPressed: () {
                navigateTo(context, FriendList());
              },
            ),
            RaisedButton(
              child: Text('Movie Search'),
              onPressed: () {
                navigateTo(context, MovieSearch());
              },
            ),
          ],
        ),
      ),
    );
  }
}
