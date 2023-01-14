import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:music_app/pages/no_auth/home_page.dart';
import 'package:music_app/pages/trend_page.dart';

FirebaseAuth auth = FirebaseAuth.instance;

void signUpFirebase(email, password) {
  try {
    auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => print(value.user));
  } catch (e) {
    debugPrint(e.toString());
  }
}

void loginFirebase(String email, String password, context) {
  try {
    auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      // Connexion réussie
      debugPrint(value.toString());
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const TrendPage()));
    }).catchError((error) {
      // Connexion échouée
      debugPrint(error.toString());
      // Affichez un message d'erreur ici
    });
  } catch (e) {
    debugPrint(e.toString());
  }
}

void logoutFirebase(context) {
  auth.signOut();
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => const HomeWithNoAuthPage()));
}
