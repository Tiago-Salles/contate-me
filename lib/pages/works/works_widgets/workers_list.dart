import 'package:contate_me/repositories/main_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../works_controller.dart';

class WorkersList extends StatelessWidget {
  const WorkersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    launchToWhatsApp(String phone) async {
      String whatsappMenssager =
          "Olá, te encontrei no app Contate-me e gostaria de saber mais sobre seus serviços.";

      if (!await launch(
        "whatsapp://send?phone=+55$phone&text=$whatsappMenssager",
        forceWebView: false,
        forceSafariVC: false,
      )) {
        return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Instale o WhatsApp para usar este recurso"),
          ),
        );
      }
    }

    launchToEmail(String email) async {
      String mailMenssager =
          "Olá, \n\n Te encontrei no app Contate-me e gostaria de saber mais sobre seus serviços.";
      String subject = "Te econtrei no Contate-me.";

      if (!await launch(
        "mailto:$email?subject=$subject=&body=$mailMenssager",
        forceWebView: false,
        forceSafariVC: false,
      )) {
        return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Instale o e-mail para usar este recurso"),
          ),
        );
      }
    }

    return Consumer<WorksController>(
      builder: (context, worksController, child) {
        if (worksController.dataFromDB.isNotEmpty) {
          return ListView.builder(
            itemCount: worksController.dataFromDB.length,
            itemBuilder: (context, index) {
              WorkerModel worker = worksController.dataFromDB[index];
              return Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(
                    bottom: 10, left: 5, right: 5, top: 10),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      spreadRadius: 2,
                      color: Colors.grey,
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 3),
                      child: Text(
                        "${worker.name}",
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 3),
                      child: Text(
                        "${worker.service}",
                        style: const TextStyle(
                          color: Colors.deepOrangeAccent,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Text(
                      "${worker.city}",
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            color: Colors.grey,
                          )
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      height: 100,
                      child: SingleChildScrollView(
                        child: Text(
                          "${worker.userMessage}",
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black54),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: InkWell(
                            onTap: () async {
                              await launchToWhatsApp("19987622664");
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 40,
                                  child: Image(
                                    image: AssetImage(
                                        "assets/images/whatsapp_icon.png"),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Text(
                                  "${worker.cellPhone}",
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black54),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: InkWell(
                            onTap: () async {
                              await launchToEmail("${worker.email}");
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 40,
                                  child: Image(
                                    image: AssetImage(
                                        "assets/images/gmail_icon.png"),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "${worker.email}",
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        worker.phone != ""
                            ? Container(
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.black54),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    await launch("tel:${worker.phone}");
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        height: 40,
                                        child: Icon(
                                          Icons.phone,
                                          color: Colors.indigoAccent,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        "${worker.phone}",
                                        style: const TextStyle(
                                          color: Colors.indigoAccent,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : Container(),
                        const SizedBox(height: 10),
                        worker.phone != ""
                            ? Container(
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.black54),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    await launch(
                                        "https://instagram.com/${worker.instagramProfile}");
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        height: 40,
                                        child: Image(
                                          image: AssetImage(
                                              "assets/images/instagram_icon.jpg"),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        "${worker.instagramProfile}",
                                        style: const TextStyle(
                                          color: Colors.purple,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : Container(),
                        const SizedBox(height: 10),
                        worker.phone != ""
                            ? Container(
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.black54),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    await launch("https://${worker.site}");
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        height: 40,
                                        child: Icon(
                                          Icons.link,
                                          color: Colors.deepPurple,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        "${worker.site}",
                                        style: const TextStyle(
                                          color: Colors.deepPurple,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  height: MediaQuery.of(context).size.height * 1 / 4,
                  decoration: const BoxDecoration(
                    color: Colors.amber,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.indigoAccent,
                        spreadRadius: 3,
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: const Image(
                    image:
                        AssetImage("assets/images/magnifying_glass_icon.png"),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: const Text(
                    "Pesquise o profissional que você precisa",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
