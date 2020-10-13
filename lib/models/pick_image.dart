import 'package:image_picker/image_picker.dart';

class PickImage{
  ImagePicker picker=ImagePicker();

  Future<String> imageFromGallery()async{
    PickedFile pickedFile=await picker.getImage(source: ImageSource.gallery);
    if(pickedFile==null)
      return null;
    else
      return pickedFile.path;
  }
  Future<String> imageFromCamera()async{
    PickedFile pickedFile=await picker.getImage(source: ImageSource.camera);
    if(pickedFile==null)
      return null;
    else
      return pickedFile.path;
  }
}