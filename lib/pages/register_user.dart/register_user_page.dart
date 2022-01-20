import 'package:contate_me/headers/main_header.dart';
import 'package:contate_me/pages/register_user/register_user_widgets/body_register_user.dart';
import 'package:flutter/material.dart';

class RegisterUser extends StatelessWidget {
  const RegisterUser({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MainHeader(child: BodyRegisterUser());
  }
}