import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:music_app/AppLayout.dart';
import 'package:music_app/pages/no_auth/SignUpSucess.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore store = FirebaseFirestore.instance;

void signUpFirebase(email, password, lastName, firstName, pseudo, birthdate,
    photoUrl, context) {
  try {
    auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      return store.collection('Users').doc(value.user!.uid).set({
        'lastname': lastName,
        'firstname': firstName,
        'pseudo': pseudo,
        'birthdate': birthdate,
        'profilephotourl': photoUrl,
        "createdAt": Timestamp.now(),
      }).then((value) {
        debugPrint("Utilisateur ajouté");
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SignUpSuccessPage()));
      }).catchError(
        (error) => print("Erreur: $error"),
      );
    });
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
          context, MaterialPageRoute(builder: (context) => AppLayoutPage()));
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
  Navigator.pop(context);
}
