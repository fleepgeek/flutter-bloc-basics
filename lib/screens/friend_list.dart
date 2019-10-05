import 'dart:async';

import 'package:flutter/material.dart';

class FriendList extends StatefulWidget {
  @override
  _FriendListState createState() => _FriendListState();
}

class _FriendListState extends State<FriendList> {
  List<String> _friends = [];
  final _friendsController = StreamController<List<String>>();

  final _textController = TextEditingController();

  @override
  void dispose() {
    _friendsController.close();
    _textController.dispose();
    super.dispose();
  }

  void addFriend(String value) {
    _friends.add(value);
    _friendsController.sink.add(_friends);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Friend List"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: _buildFriendList(),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter New Friend',
              ),
              onSubmitted: (value) {
                addFriend(value);
                _textController.clear();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFriendList() {
    return StreamBuilder<List<String>>(
        stream: _friendsController.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              itemCount: _friends.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${snapshot.data[index]}'),
                );
              },
            );
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.add),
              Text('Add New Friend'),
            ],
          );
        });
  }
}
