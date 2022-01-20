import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contate_me/infra/firestore_connection.dart';
import 'package:contate_me/models/user_model.dart';

class LoginRepository {
  void setDataOnDB(Map<String, String> json) {
    CollectionReference<Map<String, dynamic>> collection =
        FireStoreConnection.loginDBCollection;
    collection.add(json);
  }

  Future<List<UserModel>> getDataFromDB(String userEmail) async {
    List<UserModel> datas = [];
   DocumentReference<Map<String, dynamic>> dbConnection = FireStoreConnection
        .loginDBCollection.doc(userEmail);
    DocumentSnapshot<Map<String, dynamic>> dataFromDB = await dbConnection.get();
    datas.add(UserModel.fromJson(dataFromDB.data()));
    return datas;
  }
}
