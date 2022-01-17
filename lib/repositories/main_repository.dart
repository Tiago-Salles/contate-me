import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contate_me/infra/firestore_connection.dart';

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

class WorkerModel{

  String? name;
  String? email;
  String? phone;
  String? city;
  String? profession;
  String? service;
  String? differential;
  String? userMessage;
  String? cellPhone;

  WorkerModel({
    this.name, 
    this.email, 
    this.phone, 
    this.city, 
    this.profession, 
    this.service, 
    this.differential, 
    this.userMessage,
    this.cellPhone,
    });

  WorkerModel.fromJson(Map json) {
    name = json["name"] as String;
    email = json["email"] as String;
    phone = json["phone"] as String;
    cellPhone = json["cellPhone"] as String;
    city = json["city"] as String;
    profession = json["profession"] as String;
    service = json["service"] as String;
    differential = json["differential"] as String;
    userMessage = json["userMessage"] as String;
  }

}