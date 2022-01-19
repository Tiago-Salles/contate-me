import 'package:contate_me/pages/works/works_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FieldWorks extends StatelessWidget {
  final String collection;
  const FieldWorks({Key? key, required this.collection}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late String profession;
    GlobalKey<FormState> _key = GlobalKey<FormState>();

    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Form(
        key: _key,
        child: TextFormField(
          validator: (value) {
            if (value == null || value.trim() == "") {
              return "Por favor, pesquise um profissional";
            } else {
              return null;
            }
          },
          onChanged: (_profession) {
            profession = _profession;
          },
          style: const TextStyle(
            color: Colors.white,
          ),
          cursorColor: Colors.amber,
          decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topLeft: Radius.circular(10),
                topRight: Radius.circular(60),
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(60),
                bottomLeft: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
            ),
            suffixIcon: Container(
              margin: const EdgeInsets.only(right: 30),
              child: IconButton(
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    Provider.of<WorksController>(context, listen: false)
                        .getDataFromDB(profession, collection);
                  }
                },
                color: Colors.amber,
                icon: const Icon(Icons.search),
              ),
            ),
            errorStyle: TextStyle(color: Colors.red[200], fontSize: 15),
            labelText: "Qual profissional está procurando?",
            labelStyle: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
