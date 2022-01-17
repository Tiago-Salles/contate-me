import 'dart:async';

import 'package:contate_me/repositories/main_repository.dart';
class RegisterWorkBloc{
  MainRepository mainRepository = MainRepository();
  StreamController<Map<String, String>> responses = StreamController();
  Sink<Map<String, String>> get inputResponse => responses.sink;
  Stream<Map<String, String>> get outputResponse => responses.stream;
  final List<String> responsesList = [];

  void setResponse(String response){
    responsesList.add(response);
  }

  void setDataOnDB() {
    Map<String, String> _responses = {};
    int index = 1;
  }
  String value({String? value}) => value ?? "";
}

class RegisteredServiceModel{
  late String peopleName;
  late String city;
  late String service;
  late String differential;
  late String messengerUser;

  RegisteredServiceModel({
    required this.peopleName, 
    required this.city, 
    required this.service, 
    required this.differential, 
    required this.messengerUser,
  });
}