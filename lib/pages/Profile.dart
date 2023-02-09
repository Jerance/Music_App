import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:music_app/assets/font/font.dart';
import 'package:music_app/assets/theme/colors.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:music_app/services/auth.dart';

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
          userPhotoUrl = data['profilephotourl'];
        });
      } else {
        print("Aucun document trouvé");
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: gold,
        title: Text(
          'Profile Page',
          style: mainTitleDark,
        ),
      ),
      backgroundColor: mainColorDark,
      body: Center(
        child: Column(children: <Widget>[
          const SizedBox(
            height: 50,
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
              child: userPhotoUrl != null
                  ? CircleAvatar(
                      foregroundColor: gold,
                      backgroundColor: gold,
                      backgroundImage: NetworkImage(userPhotoUrl!))
                  : const Text("")),
          const SizedBox(
            height: 30,
          ),
          Text(
            userPseudo,
            style: mainTitle,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Amis 0",
                style: paragraphTextStyle,
              ),
              SizedBox(width: 10.0),
              Text(
                "Suivis 0",
                style: paragraphTextStyle,
              ),
              SizedBox(width: 10.0),
              Text(
                "Playlists 0",
                style: paragraphTextStyle,
              ),
            ],
          ),
        ]),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: gold,
              ),
              child: Text(""),
            ),
            ListTile(
              leading: const Icon(
                Icons.edit,
                color: mainColorDark,
              ),
              title: Text(
                'Edit',
                style: darkParagraph,
              ),
              onTap: () {
                // navigation code
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: mainColorDark,
              ),
              title: Text(
                'Settings',
                style: darkParagraph,
              ),
              onTap: () {
                // navigation code
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: mainColorDark,
              ),
              title: Text(
                'Deconnection',
                style: darkParagraph,
              ),
              onTap: () {
                logoutFirebase(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
