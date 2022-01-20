import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreConnection {
  static CollectionReference<Map<String, dynamic>> servicesDBCollection = FirebaseFirestore.instance.collection("services");

  static CollectionReference<Map<String, dynamic>> loginDBCollection = FirebaseFirestore.instance.collection("login");
  
}