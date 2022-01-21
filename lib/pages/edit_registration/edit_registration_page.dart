import 'package:contate_me/headers/main_header.dart';
import 'package:contate_me/pages/edit_registration/edit_registration_widgets/body_edit_registration.dart';
import 'package:flutter/material.dart';

class EditRegistrarionPage extends StatelessWidget {
  const EditRegistrarionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MainHeader(
      child: Padding(
        padding: EdgeInsets.all(30),
        child: BodyEditRegistration(),
      ),
    );
  }
}
