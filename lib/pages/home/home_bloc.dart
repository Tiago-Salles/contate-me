import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rxdart/subjects.dart';

class HomeBloc {
  BehaviorSubject<File?>? imageProfile = BehaviorSubject<File?>();
  Sink? get inputImageProfile => imageProfile?.sink;
  Stream<File?>? get outputImageProfile => imageProfile?.stream;

  void changeImage() async {
    StreamSubscription<File?>? subs;
    subs = await getImageFromGallery.call().asStream().listen((image) {
      inputImageProfile?.add(image);
      subs?.cancel();
    });
  }

  Future<File?> getImageFromGallery() async {
    XFile? _image;
    File? image;
    try {
      _image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (_image?.path != null) {
        image = File(_image!.path);
        return image;
      }
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

  
  void dispose() {
    imageProfile?.close();
  }
}
