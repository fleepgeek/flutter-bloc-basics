import 'dart:async';

import 'package:flutter_bloc_basics/bloc/base_bloc.dart';

class FriendsBloc implements BaseBloc {
  List<String> _friends = [];
  final _friendsController = StreamController<List<String>>();

  Stream<List<String>> get friendsStream => _friendsController.stream;
  List<String> get friends => _friends;

  void addFriend(String value) {
    _friends.add(value);
    _friendsController.sink.add(_friends);
  }

  void dispose() {
    _friendsController.close();
  }
}
