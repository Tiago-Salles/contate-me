import 'package:contate_me/pages/home/home_widgets/buttons_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                        "Contate-me",
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
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
            route: "",
          ),
        ],
      ),
    );
  }
}
