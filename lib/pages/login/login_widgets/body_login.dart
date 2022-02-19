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
    String? userEmail;
    String? userPassword;

    return SafeArea(
      child: StreamBuilder<bool>(
        builder: (context, snapshot) {
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
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.indigoAccent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.white)),
                    margin: const EdgeInsets.only(top: 50),
                    child: GestureDetector(
                      onTap: () async {
                        if (await Provider.of<LoginController>(context,
                                    listen: false)
                                .singInWithAccount(
                                    context, userEmail!, userPassword!) ==
                            true)
                          Navigator.of(context).pushReplacementNamed("/home");
                      },
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
                            .singInWithGoogle(context))
                          Navigator.of(context).pushReplacementNamed("/home");
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
