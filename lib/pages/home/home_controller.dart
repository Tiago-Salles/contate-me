import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends ChangeNotifier {
  Future<File?> getImageFromGallery(File? image) async {
    XFile? _image;
    try {
      _image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(_image?.path != null){
       image = File(_image!.path);
       notifyListeners();
      }
    } on PlatformException catch (e) {
      print(e.message);
    }
    return image;
  }
}
