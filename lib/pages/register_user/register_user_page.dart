import 'package:contate_me/headers/main_header.dart';
import 'package:flutter/material.dart';

import 'register_user_widgets.dart/body_register_user.dart';

class RegisterUser extends StatelessWidget {
  const RegisterUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MainHeader(
      child: Padding(
        padding: EdgeInsets.all(30),
        child: BodyRegisterUser(),
      ),
    );
  }
}
