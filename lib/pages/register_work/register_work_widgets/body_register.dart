import 'package:contate_me/models/worker_model.dart';
import 'package:contate_me/pages/register_work/register_work_bloc.dart';
import 'package:flutter/material.dart';

class BodyRegisterWork extends StatelessWidget {
  const BodyRegisterWork({Key? key}) : super(key: key);

  //ignore: todo
  //TODO: Apply good practices and new features in this file
  //Componentize the TextFormFields 

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
    WorkerModel workerModel = WorkerModel();
    RegisterWorkBloc registerWorkBloc = RegisterWorkBloc();

    String profession = "";
    String peopleName = "";
    String email = "";
    String phone = "";
    String cellPhone = "";
    String site = "";
    String instagramProfile = "";
    String city = "";
    String service = "";
    String differential = "";
    String userMessage = "";

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
                          Navigator.of(context).pushNamed("/home");
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
                    profession = value;
                  },
                  decoration: const InputDecoration(
                    labelText: "Profissão",
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 2),
                child: TextFormField(
                  validator: (value) => validade(value),
                  onChanged: (value) {
                    peopleName = value;
                  },
                  decoration: const InputDecoration(
                    labelText: "Qual é seu nome?",
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 2),
                child: TextFormField(
                  validator: (value) => validade(value),
                  onChanged: (value) {
                    cellPhone = value;
                  },
                  decoration: const InputDecoration(
                    labelText: "Celular para WhatsApp",
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 2),
                child: TextFormField(
                  onChanged: (value) {
                    phone = value;
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
                    email = value;
                  },
                  decoration: const InputDecoration(
                    labelText: "Email",
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 2),
                child: TextFormField(
                  onChanged: (value) {
                    site = value;
                  },
                  decoration: const InputDecoration(
                    labelText: "Site (opcional)",
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 2),
                child: TextFormField(
                  onChanged: (value) {
                    instagramProfile = value;
                  },
                  decoration: const InputDecoration(
                    labelText: "Perfil empresarial no Instagram (opcional)",
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 2),
                child: TextFormField(
                  validator: (value) => validade(value),
                  onChanged: (value) {
                    city = value;
                  },
                  decoration: const InputDecoration(
                    labelText: "Em qual cidade você atua?",
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 2),
                child: TextFormField(
                  validator: (value) => validade(value),
                  onChanged: (value) {
                    service = value;
                  },
                  decoration: const InputDecoration(
                    labelText: "Qual serviço você oferece",
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 2),
                child: TextFormField(
                  maxLength: 500,
                  validator: (value) => validade(value),
                  onChanged: (value) {
                    differential = value;
                  },
                  decoration: const InputDecoration(
                    counterStyle: TextStyle(
                      color: Colors.indigoAccent,
                    ),
                    labelText: "Qual é o diferencial que você oferece",
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 2),
                child: TextFormField(
                  maxLength: 1000,
                  validator: (value) => validade(value),
                  onChanged: (value) {
                    userMessage = value;
                  },
                  decoration: const InputDecoration(
                    counterStyle: TextStyle(
                      color: Colors.indigoAccent,
                    ),
                    labelText: "Atraia clientes com uma breve mensagem",
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
                          "Deseja realmente cadastrar essa atividade?",
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
                            onPressed: () async {
                              await registerWorkBloc
                                  .submitResponse(
                                workerModel.toJson(
                                  WorkerModel(
                                    site: site,
                                    instagramProfile: instagramProfile,
                                    cellPhone: cellPhone,
                                    city: city,
                                    differential: differential,
                                    email: email,
                                    name: peopleName,
                                    phone: phone,
                                    profession: profession,
                                    service: service,
                                    userMessage: userMessage,
                                  ),
                                ),
                                profession,
                                peopleName,
                              )
                                  .then(
                                (value) {
                                  Navigator.of(context)
                                      .pushReplacementNamed("/home");
                                  return ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text("Dados enviados com sucesso"),
                                      backgroundColor: Colors.green,
                                    ),
                                  );
                                },
                              ).catchError(
                                (value) =>
                                    ScaffoldMessenger.of(context).showSnackBar(
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
                      "Contate-me!",
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
}
