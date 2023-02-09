import 'package:flutter/material.dart';

import 'package:music_app/assets/font/font.dart';
import 'package:music_app/assets/theme/colors.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
      body: Center(
        child: Column(children: <Widget>[
          const SizedBox(
            height: 75,
          ),
          Text(
            'Réseaux Sociaux',
            style: mainTitle,
          ),
          StreamBuilder(
            stream: _firestore
                .collection("users")
                .where("uid", isNotEqualTo: user?.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              final users = snapshot.data?.docs;

              return ListView.builder(
                itemCount: users?.length,
                itemBuilder: (context, index) {
                  final user = users![index];
                  final username = user.data()["pseudo"];
                  final photoUrl = user.data()["photoUrl"];

                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(photoUrl),
                    ),
                    title: Text(username),
                  );
                },
              );
            },
          ),
        ]),
      ),
    );
  }
}
