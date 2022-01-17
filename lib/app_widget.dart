import 'package:contate_me/pages/home/home_page.dart';
import 'package:contate_me/pages/works/works_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'headers/main_header.dart';
import 'pages/register_work/register_work_page.dart';
import 'pages/works/works_controller.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WorksController())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        routes: {
          "/home" : (context) => const HomePage(),
          "/work" : (context) => const WorksPage(),
          "/registerWork" : (context) => const RegisterWorkPage(),
        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MainHeader(child: HomePage()),
      ),
    );
  }
}