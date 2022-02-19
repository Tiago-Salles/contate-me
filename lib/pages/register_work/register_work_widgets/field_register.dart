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
        decoration: InputDecoration(
          labelText: hintText,
        ),
      ),
    );
  }
}