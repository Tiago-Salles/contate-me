import 'package:contate_me/infra/firestore_connection.dart';
import 'package:flutter/material.dart';

class BodyRegisterUser extends StatelessWidget {
  const BodyRegisterUser({Key? key}) : super(key: key);

  validade(String? value) {
    if (value == null || value.trim() == "") {
      return "Este campo é obrigatório";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _key = GlobalKey<FormState>();

    String userName = "";
    String userAge = "";
    String userEmail = "";
    String userPhone = "";
    String userCellPhone = "";
    String userPassword = "";
    String userPassword2 = "";

    return SafeArea(
      child: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.indigoAccent,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: IconButton(
                        color: Colors.amber,
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed("/login");
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Container(
                margin: const EdgeInsets.only(top: 2),
                child: TextFormField(
                  validator: (value) => validade(value),
                  onChanged: (value) {
                    userName = value;
                  },
                  decoration: const InputDecoration(
                    labelText: "Qual é seu nome completo?",
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 2),
                child: TextFormField(
                  validator: (value) => validade(value),
                  maxLength: 2,
                  onChanged: (value) {
                    userAge = value;
                  },
                  decoration: const InputDecoration(
                    labelText: "Qual é sua idade?",
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 2),
                child: TextFormField(
                  validator: (value) => validade(value),
                  onChanged: (value) {
                    userCellPhone = value;
                  },
                  decoration: const InputDecoration(
                    labelText: "Celular",
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 2),
                child: TextFormField(
                  onChanged: (value) {
                    userPhone = value;
                  },
                  decoration: const InputDecoration(
                    labelText: "Telefone",
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 2),
                child: TextFormField(
                  validator: (value) => validade(value),
                  onChanged: (value) {
                    userEmail = value;
                  },
                  decoration: const InputDecoration(
                    labelText: "Email",
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 2),
                child: TextFormField(
                  validator: (value) => validade(value),
                  onChanged: (value) {
                    userPassword = value;
                  },
                  decoration: const InputDecoration(
                    labelText: "Digite uma senha para usar como login",
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 2),
                child: TextFormField(
                  validator: (value) => validade(value),
                  onChanged: (value) {
                    userPassword2 = value;
                  },
                  decoration: const InputDecoration(
                    labelText: "Repita a senha",
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  if (_key.currentState!.validate()) {
                    if (userPassword == userPassword2) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: const Text(
                            "Deseja continuar?",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Não",
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                FireStoreConnection.loginDBCollection
                                    .doc(userEmail)
                                    .set(
                                  {
                                    "userName": userName,
                                    "userEmail": userEmail,
                                    "userCellPhone": userCellPhone,
                                    "userPhone": userPhone,
                                    "userPassword": userPassword,
                                    "userAge": userAge,
                                  },
                                ).then(
                                  (value) {
                                    Navigator.of(context)
                                        .pushReplacementNamed("/login");
                                    return ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text("Cadastro salvo com sucesso"),
                                        backgroundColor: Colors.green,
                                      ),
                                    );
                                  },
                                ).catchError(
                                  (value) => ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          "Ocorreu um erro em enviar os dados"),
                                      backgroundColor: Colors.red,
                                    ),
                                  ),
                                );
                              },
                              child: const Text("Sim"),
                            )
                          ],
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("As senhas digitadas nao sao iguais"),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  }
                },
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.indigoAccent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      )),
                  margin: const EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: 40,
                  child: const Center(
                    child: Text(
                      "Registre-me!",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
