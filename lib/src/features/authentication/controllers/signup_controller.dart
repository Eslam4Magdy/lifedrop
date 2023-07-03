import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lifedrop/src/features/navigation_bar/nav_bar.dart';
import 'package:lifedrop/src/repository/user_repository/user_repository.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';
import '../models/user_model.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  // TextField Controller to get data From TextField
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController fullName = TextEditingController();
  final TextEditingController phoneNo = TextEditingController();

  final userRepo = Get.put(UserRepository());

  void registerUser(String email , String password){
    String? error = AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password) as String?;
    if(error != null){
      Get.showSnackbar((GetSnackBar(message: error.toString(),)));
    }
  }

  Future<void> createUser(UserModel user)async{
    await userRepo.createUser(user);
    Get.to(() => const NavBar());
  }

}
