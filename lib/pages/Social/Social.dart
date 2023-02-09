import 'package:flutter/material.dart';

import 'package:music_app/assets/theme/colors.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:music_app/pages/Social/Chat.dart';

class SocialPage extends StatefulWidget {
  const SocialPage({Key? key}) : super(key: key);

  @override
  _SocialPageState createState() => _SocialPageState();
}

class _SocialPageState extends State<SocialPage> {
  User? user = FirebaseAuth.instance.currentUser;
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: mainColorDark,
        body: Center(
          child: UsersList(),
        ));
  }
}

class UsersList extends StatefulWidget {
  const UsersList({Key? key}) : super(key: key);

  @override
  _UsersListState createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('Users').snapshots();

  void openChat(String userID, String userName, String userPhoto) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ChatPage(userID, userName, userPhoto)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            debugPrint(document.id);

            return InkWell(
              onTap: () => openChat(
                  document.id, data['pseudo'], document['profilephotourl']),
              child: UserLineDesign(
                  document.id, data['pseudo'], document['profilephotourl']),
            );
          }).toList(),
        );
      },
    );
  }
}

class UserLineDesign extends StatelessWidget {
  final String _userID;
  final String _pseudo;
  final String _photoUrl;
  const UserLineDesign(this._userID, this._pseudo, this._photoUrl, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 10, 10, 10),
      child: Row(
        children: [
          SizedBox(
            height: 70,
            width: 70,
            child: CircleAvatar(
              backgroundImage: NetworkImage(_photoUrl),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_pseudo,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}
