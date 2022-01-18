import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contate_me/infra/firestore_connection.dart';
import 'package:contate_me/models/worker_model.dart';

class MainRepository{

  void setDataOnDB(String _collection, Map<String, String> json){
    var collection = FirebaseFirestore.instance.collection(_collection);
    collection.add(json);
  }

  Future<List<WorkerModel>> getDataFromDB(String profession, String collection) async{
    
    List<WorkerModel> datas = [];
    CollectionReference<Map<String, dynamic>> dbConnection =   FireStoreConnection.servicesDBCollection.doc(profession).collection(collection);

    QuerySnapshot<Map<String, dynamic>> dataFromDB = await dbConnection.get();
    dataFromDB.docs.forEach((element) { 
    datas.add(WorkerModel.fromJson(element.data()));
    });

    return datas;
  }
}
