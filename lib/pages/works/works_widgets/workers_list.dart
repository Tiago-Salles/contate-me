import 'package:contate_me/models/worker_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../works_controller.dart';
import 'each_item_of_wokers_list.dart';

class WorkersList extends StatelessWidget {
  const WorkersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<WorksController>(
      builder: (context, worksController, child) {
        if (worksController.dataFromDB.isNotEmpty) {
          return ListView.builder(
            itemCount: worksController.dataFromDB.length,
            itemBuilder: (context, index) {
              WorkerModel worker = worksController.dataFromDB[index];
              return EachItemOfWorkersList(worker: worker);
            },
          );
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  height: MediaQuery.of(context).size.height * 1 / 4,
                  decoration: const BoxDecoration(
                    color: Colors.amber,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.indigoAccent,
                        spreadRadius: 3,
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: const Image(
                    image:
                        AssetImage("assets/images/magnifying_glass_icon.png"),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: const Text(
                    "Pesquise o profissional que você precisa",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
