import 'dart:async';
import 'package:contate_me/models/worker_model.dart';
import 'package:contate_me/repositories/service_repository.dart';
import 'package:rxdart/rxdart.dart';

//ignore: todo
////TODO: Apply good practices and new features in this file

class WorksBloc {
  ServiceRepository serviceRepository = ServiceRepository();
  BehaviorSubject<List<WorkerModel>>? dataFromDB = BehaviorSubject<List<WorkerModel>>();
  Sink<List<WorkerModel>>? get inputDataFromDB => dataFromDB?.sink;
  Stream<List<WorkerModel>>? get outputDataFromDB =>
      dataFromDB?.stream;

  void getDataFromDB(String profession, String collection) async {
    try {
      inputDataFromDB
          ?.add(await serviceRepository.getDataFromDB(profession, collection));
    } catch (e) {
      print(e);
    }
  }
}
