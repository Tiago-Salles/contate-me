import 'package:contate_me/headers/main_header.dart';
import 'package:flutter/material.dart';
import 'home_widgets/body_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainHeader(child: BodyHome());
  }
}
