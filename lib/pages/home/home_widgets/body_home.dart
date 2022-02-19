import 'dart:io';
import 'package:contate_me/pages/home/home_widgets/buttons_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../home_bloc.dart';

class BodyHome extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    final homeBloc = Provider.of<HomeBloc>(context, listen: false);
    final loggedUser = FirebaseAuth.instance.currentUser;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: const BoxDecoration(
                color: Colors.indigoAccent,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: homeBloc.changeImage,
                    child: Container(
                      child: StreamBuilder<File?>(
                        stream: homeBloc.outputImageProfile,
                        builder: (context, snapshot) {
                          if (loggedUser?.photoURL != null) {
                            return Container(
                              height: 110,
                              width: 110,
                              padding: const EdgeInsets.all(5),
                              margin: const EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.network(loggedUser!.photoURL!),
                            );
                          } else if (snapshot.data != null) {
                            return Container(
                              height: 110,
                              width: 110,
                              padding: const EdgeInsets.all(5),
                              margin: const EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.file(snapshot.data ?? File("")),
                            );
                          } else {
                            return Container(
                              height: 110,
                              width: 110,
                              padding: const EdgeInsets.all(5),
                              margin: const EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(
                                Icons.image,
                                size: 80,
                                color: Colors.white,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Olá ${loggedUser != null ? loggedUser.displayName : ""}!",
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.13,
            ),
            const ButtonHome(
              title: "Busque por serviços",
              subtitle: "Por aqui você busca prestadores de serviços",
              icon: Icons.electrical_services_outlined,
              route: "/work",
            ),
            const ButtonHome(
              title: "Cadastrar uma atividade",
              subtitle: "Por aqui você cadastra atividades",
              icon: Icons.work_outline,
              route: "/registerWork",
            ),
            const ButtonHome(
              title: "Editar meu cadastro",
              subtitle: "Por aqui você edita seu cadastro",
              icon: Icons.supervised_user_circle,
              route: "/editRegistrarion",
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
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
  }
}
