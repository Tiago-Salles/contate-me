import 'package:contate_me/pages/edit_registration/edit_registration_controller.dart';
import 'package:contate_me/pages/home/home_controller.dart';
import 'package:contate_me/pages/home/home_page.dart';
import 'package:contate_me/pages/login/login_controller.dart';
import 'package:contate_me/pages/login/login_page.dart';
import 'package:contate_me/pages/register_user/register_user_page.dart';
import 'package:contate_me/pages/splash/splash_page.dart';
import 'package:contate_me/pages/works/works_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'headers/main_header.dart';
import 'pages/edit_registration/edit_registration_page.dart';
import 'pages/register_user/register_user_controller.dart';
import 'pages/register_work/register_work_page.dart';
import 'pages/works/works_controller.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WorksController()),
        ChangeNotifierProvider(create: (_) => HomeController()),
        ChangeNotifierProvider(create: (_) => LoginController()),
        ChangeNotifierProvider(create: (_) => RegisterUserController()),
        ChangeNotifierProvider(create: (_) => EditRegistrarionController()),
      ],
      child: FutureBuilder(
        future: SplashPage.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: SplashPage(),
            );
          } else {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              routes: {
                "/home": (context) => const HomePage(),
                "/work": (context) => const WorksPage(),
                "/registerWork": (context) => const RegisterWorkPage(),
                "/registerUser": (context) => const RegisterUser(),
                "/login": (context) => const LoginPage(),
                "/editRegistrarion": (context) => const EditRegistrarionPage(),
              },
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: const MainHeader(child: LoginPage()),
            );
          }
        },
      ),
    );
  }
}
