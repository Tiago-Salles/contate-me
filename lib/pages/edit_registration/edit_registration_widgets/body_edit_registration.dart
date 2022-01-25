import 'package:contate_me/infra/firestore_connection.dart';
import 'package:contate_me/pages/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../edit_registration_controller.dart';

class BodyEditRegistration extends StatelessWidget {
  const BodyEditRegistration({Key? key}) : super(key: key);

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

    String userEmail = "";
    String userPhone = "";
    String userCellPhone = "";

    return Consumer<EditRegistrarionController>(
      builder: (context, editRegistrarion, widget) {
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
                              Navigator.of(context).pushReplacementNamed("/home");
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
                  InkWell(
                    onTap: () {
                      if (_key.currentState!.validate()) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content: const Text(
                                "Deseja realmente alterar dados do seu cadastro?",
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
                                        .update(
                                      {
                                        "userEmail": userEmail,
                                        "userCellPhone": userCellPhone,
                                        "userPhone": userPhone,
                                      },
                                    ).then(
                                      (value) {
                                        Navigator.of(context)
                                            .pushReplacementNamed("/hone");
                                        return ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content:
                                                Text("Cadastro editado com sucesso"),
                                            backgroundColor: Colors.green,
                                          ),
                                        );
                                      },
                                    ).catchError(
                                      (value) => ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              "Ocorreu um erro em editar o cadastro"),
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
                          "Editar meu cadastro",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 20,
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
    );
  }
}
