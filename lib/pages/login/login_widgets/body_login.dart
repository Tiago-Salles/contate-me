import 'dart:async';
import 'package:contate_me/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../login_controller.dart';

class BodyLogin extends StatelessWidget {
  const BodyLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String userEmail = "";
    String userPassword = "";

    return SafeArea(
      child: Consumer<LoginController>(
        builder: (context, loginController, widget) {
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 50, top: 50),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.indigoAccent,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  TextFormField(
                    onChanged: (value) {
                      userEmail = value;
                    },
                    decoration: const InputDecoration(
                      labelText: "Login",
                      hintText: "Digite seu e-mail",
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    onChanged: (value) {
                      userPassword = value;
                    },
                    decoration: const InputDecoration(
                      labelText: "Digite sua senha",
                      hintText: "",
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed("/registerUser");
                        },
                        child: const Text("nao tenho cadastro"),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text("esqueci a minha senha"),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      StreamSubscription<List<UserModel>>? subs;
                      subs =
                          Provider.of<LoginController>(context, listen: false)
                              .getDataFromDB(userEmail)
                              .asStream()
                              .listen((event) {
                        if (event.first.userPassword == userPassword) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: const Duration(seconds: 2),
                              backgroundColor: Colors.amber[200],
                              content: const Text(
                                "Bom ter você por aqui!",
                                style: TextStyle(
                                  color: Colors.indigoAccent,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          );
                          Navigator.of(context).pushReplacementNamed("/home");
                          subs?.cancel();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(seconds: 2),
                              backgroundColor: Colors.red,
                              content: Text(
                                "Senha incorreta",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          );
                          subs?.cancel();
                        }
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.indigoAccent,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: Colors.white)),
                      margin: const EdgeInsets.only(top: 50),
                      child: const Center(
                        child: Text(
                          "Entrar",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.indigoAccent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.white)),
                    margin: const EdgeInsets.only(top: 10),
                    child: GestureDetector(
                      onTap: () async {
                        if (await Provider.of<LoginController>(context,
                                    listen: false)
                                .signInWithGoogle() ==
                            true) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: const Duration(seconds: 2),
                              backgroundColor: Colors.amber[200],
                              content: const Text(
                                "Bom ter você por aqui!",
                                style: TextStyle(
                                  color: Colors.indigoAccent,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          );
                          Navigator.of(context).pushReplacementNamed("/home");
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: const Text(
                                  "Algo deu errado com seu login, por favor tente novamente.",
                                  style: TextStyle(
                                    color: Colors.amber,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
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
                            },
                          );
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Center(
                            child: FaIcon(
                              FontAwesomeIcons.google,
                              color: Colors.amber,
                            ),
                          ),
                          SizedBox(width: 20),
                          Center(
                            child: Text(
                              "Entrar com Google",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.34,
                  ),
                  const Text(
                    "Contate-me",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.indigoAccent,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
