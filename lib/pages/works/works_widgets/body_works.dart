import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'field_works.dart';
import 'workers_list.dart';

class BodyWorks extends StatelessWidget {
  final String collection;
  const BodyWorks({Key? key, required this.collection}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: const BoxDecoration(
              color: Colors.indigoAccent,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(60),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () async{
                    await Navigator.of(context).pushReplacementNamed("/home");
                  },
                  iconSize: 25,
                  color: Colors.amber,
                  icon: const Icon(Icons.arrow_back),
                ),
                FieldWorks(collection: collection)
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
              height: MediaQuery.of(context).size.height * 0.75,
              child: const Center(
                child: WorkersList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
