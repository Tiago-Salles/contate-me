import 'dart:async';

import 'package:contate_me/repositories/service_repository.dart';
class RegisterWorkBloc{
  ServiceRepository mainRepository = ServiceRepository();
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