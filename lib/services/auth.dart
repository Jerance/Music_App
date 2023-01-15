import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:music_app/pages/no_auth/home_page.dart';
import 'package:music_app/pages/trend_page.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore store = FirebaseFirestore.instance;

void signUpFirebase(email, password, lastName, firstName, pseudo, birthdate) {
  try {
    auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user!.uid);
      createUser(value.user!.uid, lastName, firstName, pseudo, birthdate);
    });
  } catch (e) {
    debugPrint(e.toString());
  }
}

Future<void> createUser(
    String userID, lastName, firstName, pseudo, birthdate) async {
  return store
      .collection('Users')
      .doc(userID)
      .set({
        'lastname': lastName,
        'firstname': firstName,
        'pseudo': pseudo,
        'birthdate': birthdate,
      })
      .then((value) => print("Utilisateur ajouté"))
      .catchError(
        (error) => print("Erreur: $error"),
      );
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
