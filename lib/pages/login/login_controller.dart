import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends ChangeNotifier {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount? get user => _user;

  Future<bool> signInWithGoogle() async {
    bool userLogged;

    try {
      final signIn = await googleSignIn.signIn();
      _user = signIn;
      final googleAuth = await signIn?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      userLogged = true;
      notifyListeners();
    } catch (e) {
      userLogged = false;
    }
    return userLogged;
  }
}
