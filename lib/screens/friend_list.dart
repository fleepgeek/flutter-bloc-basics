import 'package:flutter/material.dart';
import 'package:flutter_bloc_basics/bloc/bloc_provider.dart';
import 'package:flutter_bloc_basics/bloc/friends_bloc.dart';

class FriendList extends StatefulWidget {
  @override
  _FriendListState createState() => _FriendListState();
}

class _FriendListState extends State<FriendList> {
  FriendsBloc friendsBloc;
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    friendsBloc = FriendsBloc();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // We are not currently making use of the
    // BlocProvider.of(context) method down this widget tree
    // but we're implicitly making use of the BlocProvider's
    // dispose() method by default
    return BlocProvider<FriendsBloc>(
      bloc: friendsBloc,
      child: Scaffold(
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
                  friendsBloc.addFriend(value);
                  _textController.clear();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFriendList() {
    return StreamBuilder<List<String>>(
        stream: friendsBloc.friendsStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              itemCount: friendsBloc.friends.length,
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
