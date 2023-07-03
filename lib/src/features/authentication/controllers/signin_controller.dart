import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find();

  // TextField Controller to get data From TextField
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  void loginUser(String email , String password){
    AuthenticationRepository.instance.loginUserWithEmailAndPassword(email, password);
  }
}
