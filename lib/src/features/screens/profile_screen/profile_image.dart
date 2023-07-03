import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifedrop/src/constants/images.dart';
import 'controller/profile_image_controller.dart';

class ProfileImage extends GetView<ProfileImageController> {
  const ProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileImageController());
    return Stack(
      children: [
        SizedBox(
          width: 120,
          height: 120,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Obx(
                  () => controller.image.value != null
                  ? Image.file(controller.image.value!)
                  : Image.asset(defaultProfileImage), // Replace with your default profile image asset path
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: InkWell(
            onTap: () {
              Get.dialog(
                AlertDialog(
                  title: const Text('Choose an option'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: const Icon(Icons.photo_library),
                        title: const Text('Choose from gallery'),
                        onTap: () async{
                          Get.back();
                          controller.getImageFromGallery();
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.camera_alt),
                        title: const Text('Take a photo'),
                        onTap: () {
                          Get.back();
                          controller.getImageFromCamera();
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.black,
              ),
              child: const Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}