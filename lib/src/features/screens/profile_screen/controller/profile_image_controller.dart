// ignore_for_file: deprecated_member_use
import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImageController extends GetxController {
  Rx<File?> image = Rxn<File>();

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    }
  }

  void getImageFromGallery() async => await _getImage(ImageSource.gallery);

  void getImageFromCamera() async => await _getImage(ImageSource.camera);
}
