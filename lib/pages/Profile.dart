import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:music_app/assets/font/font.dart';
import 'package:music_app/assets/theme/colors.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

FirebaseStorage storage = FirebaseStorage.instance;

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? user = FirebaseAuth.instance.currentUser;

  String? userPhotoUrl;
  String test =
      "https://media.istockphoto.com/id/1223671392/fr/vectoriel/photo-de-profil-par-d%C3%A9faut-avatar-photo-placeholder-illustration-de-vecteur.jpg?s=170667a&w=0&k=20&c=EqD6q8IUqwN_bgGec0UBhh3tk2Zuur5lezDDlQsGdPY=";
  String userUid = "";
  String userPseudo = "";

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    final DocumentReference document =
        FirebaseFirestore.instance.collection("Users").doc(user?.uid);
    await document.get().then((snapshot) {
      if (snapshot.exists) {
        setState(() {
          var data = snapshot.data() as Map;
          userPseudo = data['pseudo'];
          getProfilImage();
        });
      } else {
        print("Aucun document trouvé");
      }
    });
  }

  getProfilImage() {
    Reference ref = storage.ref().child("UsersPhoto/${userPseudo}.png");
    ref.getDownloadURL().then((downloadUrl) {
      setState(() {
        userPhotoUrl = downloadUrl.toString();
        debugPrint(userPhotoUrl);
      });
    }).catchError((e) {
      setState(() {
        print('Un problème est survenu: ${e}');
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColorDark,
      body: Center(
        child: Column(children: <Widget>[
          const SizedBox(
            height: 100,
          ),
          Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: gold,
                boxShadow: const [
                  BoxShadow(color: gold, blurStyle: BlurStyle.solid),
                ],
              ),
              child: CircleAvatar(
                foregroundColor: gold,
                backgroundColor: gold,
                backgroundImage: userPhotoUrl != null
                    ? NetworkImage(userPhotoUrl!)
                    : NetworkImage(test),
              )),
          const SizedBox(
            height: 20,
          ),
          Text(
            userPseudo,
            style: mainTitle,
          ),
        ]),
      ),
    );
  }
}
