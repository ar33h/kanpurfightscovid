import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_database/firebase_database.dart';
import './model/user.dart';
import 'list.dart';

class PostReq extends StatefulWidget {

  @override
  _PostReqState createState() => _PostReqState();
}

final userReference = FirebaseDatabase.instance.reference().child('user');

class _PostReqState extends State<PostReq> {

  List<User> items;
  StreamSubscription<Event> _onUserAddedSubscription;
  StreamSubscription<Event> _onUserChangedSubscription;

  @override
  void initState() {
    super.initState();

    items = new List();

    _onUserAddedSubscription = userReference.onChildAdded.listen(_onUserAdded);
    _onUserChangedSubscription = userReference.onChildChanged.listen(_onUserUpdated);
  }

  @override
  void dispose() {
    _onUserAddedSubscription.cancel();
    _onUserChangedSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('List of Requirements', ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: new Expanded(
          child: ListView.builder(
              itemCount: items.length,
              padding: const EdgeInsets.all(15.0),
              itemBuilder: (context, int position) {
                return Column(
                  children: <Widget>[
                    Divider(height: 5.0),
                    ListTile(
                      title: Text(
                        '${items[position].mobile}',
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
                      
                      subtitle: Text(
                        '${items[position].requirements}',
                        style: new TextStyle(
                          fontSize: 18.0,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      
                      leading: Column(
                        children: <Widget>[
                          Padding(padding: EdgeInsets.all(10.0)),
                          CircleAvatar(
                            backgroundColor: Colors.blueAccent,
                            radius: 15.0,
                            child: Text(
                              '${position + 1}',
                              style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          IconButton(
                              icon: const Icon(Icons.remove_circle_outline),
                              onPressed: () => _deleteUser(context, items[position], position)),
                        ],
                      ),
                      onTap: () => _navigateToUser(context, items[position]),
                    ),
                  ],
                );
              }),
        ),),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _createNewUser(context),
        ),
      ),
    );
  }

  void _onUserAdded(Event event) {
    setState(() {
      items.add(new User.fromSnapshot(event.snapshot));
    });
  }

  void _onUserUpdated(Event event) {
    var oldUserValue = items.singleWhere((user) => user.name == event.snapshot.key);
    setState(() {
      items[items.indexOf(oldUserValue)] = new User.fromSnapshot(event.snapshot);
    });
  }

  void _deleteUser(BuildContext context, User user, int position) async {
    await userReference.child(user.name).remove().then((_) {
      setState(() {
        items.removeAt(position);
      });
    });
  }

  void _navigateToUser(BuildContext context, User user) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ListReq(user)),
    );
  }

  void _createNewUser(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ListReq(User(null, '', ''))),
    );
  }
}
