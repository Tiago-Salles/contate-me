import 'dart:async';
import 'package:contate_me/models/user_model.dart';
import 'package:contate_me/pages/login/login_widgets/snack_bar_helper.dart';
import 'package:contate_me/repositories/login_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'login_widgets/alert_dialog_helper.dart';

class LoginController{
  LoginRepository loginRepository = LoginRepository();
  final GoogleSignIn googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount? get user => _user;
  List<UserModel> datasFromDB = [];

  Future<bool> singInWithAccount(
      BuildContext context, String userEmail, String userPassword) async {
    StreamSubscription<List<UserModel>>? subs;
    Completer<bool> completer = Completer<bool>();

    subs = await getDataFromDB(userEmail).asStream().listen(
      (event) {
        if (event.first.userPassword == userPassword) {
          SnackBarHelper.showSnackBar(context, "Bom ter você por aqui!",
              backgroundColor: Colors.amber[200],
              textColor: Colors.indigoAccent);
          completer.complete(true);
          subs?.cancel();
        } else {
          SnackBarHelper.showSnackBar(context, "Senha incorreta",
              backgroundColor: Colors.red, textColor: Colors.white);
          completer.complete(false);
          subs?.cancel();
        }
      },
    );
    return await completer.future;
  }

  Future<bool> singInWithGoogle(BuildContext context) async {
    Completer<bool> completer = Completer<bool>();
    StreamSubscription<bool>? subs;

    subs = await authenticateGoogle().asStream().listen((event) {
      if (event == true) {
        SnackBarHelper.showSnackBar(context, "Bom ter você por aqui!",
            backgroundColor: Colors.amber[200], textColor: Colors.indigoAccent);
        completer.complete(true);
      } else {
        AlertDialogHelper.showMyDialog(
          context,
          "Algo deu errado com seu login, por favor tente novamente.",
          Colors.amber,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Ok",
                style: TextStyle(
                  color: Colors.indigoAccent,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        );
        completer.complete(false);
      }
    });
    return await completer.future;
  }

  Future<bool> authenticateGoogle() async {
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
    } catch (e) {
      userLogged = false;
    }
    return userLogged;
  }

  Future<List<UserModel>> getDataFromDB(String userEmail) async {
    try {
      datasFromDB = await loginRepository.getDataFromDB(userEmail);
    } catch (e) {
      print(e);
    }
    return datasFromDB;
  }
}
