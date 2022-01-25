import 'package:contate_me/pages/register_work/register_work_bloc.dart';
import 'package:flutter/material.dart';

class TextFormFieldHelper extends StatelessWidget{
  final String hintText;
  TextFormFieldHelper({ Key? key, required this.hintText}) : super(key: key);
  final RegisterWorkBloc registerBlock = RegisterWorkBloc();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top:2),
      child: TextFormField(
        onChanged: (value) {
        },
        //   RegisteredService(
        //     city: hintText.contains("cidade") ? value : "",
        //     differential: hintText.contains("diferencial") ? value : "",
        //     peopleName: hintText.contains("nome") ? value : "",
        //     messengerUser: hintText.contains("mensagem") ? value : "",
        //     service: hintText.contains("servi'co") ? value : "",
        //     );
        // },
        decoration: InputDecoration(
          labelText: hintText,
        ),
      ),
    );
  }
}