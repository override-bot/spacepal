import 'dart:io';

import 'package:image_picker/image_picker.dart';

class MediaServices{
  Future<File> selectImage() async{
   late File _image;
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if(pickedFile != null){
      _image = File(pickedFile.path);
    }
    return _image;
  }
}