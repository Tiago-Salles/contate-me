import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contate_me/infra/firestore_connection.dart';
import 'package:contate_me/models/worker_model.dart';

class ServiceRepository {
  void setDataOnDB(Map<String, String> json) {
    CollectionReference<Map<String, dynamic>> collection = FireStoreConnection
        .servicesDBCollection;
    collection.add(json);
  }

  Future<List<WorkerModel>> getDataFromDB(
      String profession, String collection) async {
    List<WorkerModel> datas = [];
    CollectionReference<Map<String, dynamic>> dbConnection = FireStoreConnection
        .servicesDBCollection
        .doc(profession)
        .collection(collection);

    QuerySnapshot<Map<String, dynamic>> dataFromDB = await dbConnection.get();
    for (var element in dataFromDB.docs) {
      datas.add(WorkerModel.fromJson(element.data()));
    }
    return datas;
  }
}
