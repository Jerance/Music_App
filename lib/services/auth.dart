import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:music_app/pages/no_auth/home_page.dart';
import 'package:music_app/pages/trend_page.dart';

FirebaseAuth auth = FirebaseAuth.instance;

void loginFirebase(String email, String password, context) {
  try {
    auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      // Connexion réussie
      print(value.toString());
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const TrendPage()));
    }).catchError((error) {
      // Connexion échouée
      print(error.toString());
      // Affichez un message d'erreur ici
    });
  } catch (e) {
    print(e.toString());
  }
}

void logoutFirebase(context) {
  auth.signOut();
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => const HomeWithNoAuthPage()));
}
