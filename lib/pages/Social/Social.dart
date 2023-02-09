import 'package:flutter/material.dart';
import 'package:music_app/assets/font/font.dart';

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
    return Scaffold(
        backgroundColor: mainColorDark,
        body: Column(
          children: <Widget>[
            const SizedBox(
              height: 75,
            ),
            Text(
              'SocialPage',
              style: mainTitle,
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFF1A1A1A),
              ),
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: gold,
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text('Messages'),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.message,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: gold,
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text('Groupes'),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.group,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: gold,
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text('Liste amis'),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.list,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
            const Expanded(
              child: UsersList(),
            ),
          ],
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
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
      child: Row(
        children: [
          SizedBox(
            height: 50,
            width: 50,
            child: CircleAvatar(
              backgroundImage: NetworkImage(_photoUrl),
            ),
          ),
          const SizedBox(width: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_pseudo,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: mainColorLight)),
            ],
          ),
        ],
      ),
    );
  }
}
