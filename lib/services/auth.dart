import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;

void loginFirebase(String email, String password) {
  try {
    auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => print(value.toString()));
  } catch (e) {
    print(e.toString());
  }
}

void logoutFirebase() {
  auth.signOut();
}
