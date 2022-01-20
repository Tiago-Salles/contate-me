import 'package:contate_me/models/worker_model.dart';
import 'package:contate_me/repositories/service_repository.dart';
import 'package:flutter/material.dart';

class WorksController extends ChangeNotifier {
  ServiceRepository serviceRepository = ServiceRepository();
  List<WorkerModel> dataFromDB = [];

  Future<List<WorkerModel>> getDataFromDB(
      String profession, String collection) async {
    try {
      const CircularProgressIndicator();
      dataFromDB = await serviceRepository.getDataFromDB(profession, collection);
      notifyListeners();
    } catch (e) {
      print(e);
    }
    return dataFromDB;
  }
}
