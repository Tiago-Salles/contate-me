import 'package:contate_me/repositories/main_repository.dart';
import 'package:flutter/material.dart';

class WorksController extends ChangeNotifier{
  MainRepository mainRepository = MainRepository();
  List<WorkerModel> dataFromDB = [];

  Future<List<WorkerModel>> getDataFromDB(String profession, String collection) async {
    try {
      dataFromDB = await mainRepository.getDataFromDB(profession, collection);
      notifyListeners();
    } catch (e) {
      print(e);
    } 
    return dataFromDB;
  }
}