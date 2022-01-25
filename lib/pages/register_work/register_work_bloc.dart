import 'package:contate_me/infra/firestore_connection.dart';

class RegisterWorkBloc {
  Future<void> submitResponse(
      Map<String, String> json, String profession, String peopleName) async {
   await FireStoreConnection.servicesDBCollection
        .doc(profession)
        .collection("users")
        .doc(peopleName)
        .set(json);
  }
}
