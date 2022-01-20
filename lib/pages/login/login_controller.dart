import 'package:contate_me/models/user_model.dart';
import 'package:contate_me/repositories/login_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends ChangeNotifier {
  LoginRepository loginRepository = LoginRepository();
  final GoogleSignIn googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount? get user => _user;
  List<UserModel> datasFromDB = [];

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


  Future<List<UserModel>> getDataFromDB(String userEmail) async {
    try {
      datasFromDB = await loginRepository.getDataFromDB(userEmail);
      notifyListeners();
    } catch (e) {
      print(e);
    }
    return datasFromDB;
  }
}
