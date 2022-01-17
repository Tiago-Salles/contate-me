import 'package:contate_me/headers/main_header.dart';
import 'package:flutter/material.dart';
import 'register_work_widgets/body_register.dart';


class RegisterWorkPage extends StatelessWidget {
  const RegisterWorkPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const MainHeader(
      child: Padding(
        padding: EdgeInsets.all(30),
        child:  BodyRegisterWork(),
      ),
    );
  }
}