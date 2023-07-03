import 'package:get/get.dart';
import 'package:lifedrop/src/repository/user_repository/user_repository.dart';
import '../../../../repository/authentication_repository/authentication_repository.dart';
import '../../../authentication/models/user_model.dart';

// class ProfileController extends GetxController {
//   static ProfileController get instance => Get.find();
//
//   final _authRepo = Get.put(AuthenticationRepository());
//   final _userRepo = Get.put(UserRepository());
//
//   Future<void> setUserData(UserModel user) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString('email', user.email);
//     prefs.setString('fullName', user.fullName);
//     prefs.setString('phoneNo', user.phoneNo);
//     prefs.setString('address', user.address!);
//     prefs.setString('age', user.age!);
//     prefs.setString('lastDonation', user.lastDonation!);
//     prefs.setString('bloodType', user.bloodType!);
//     prefs.setString('gender', user.gender!);
//   }
//
//   Future<UserModel> getUserDataFromPrefs() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     UserModel user = UserModel(
//       email: prefs.getString('email') ?? '',
//       fullName: prefs.getString('fullName') ?? '',
//       phoneNo: prefs.getString('phoneNo') ?? '',
//       address: prefs.getString('address') ?? '',
//       age: prefs.getString('age') ?? '',
//       lastDonation: prefs.getString('lastDonation') ?? '',
//       bloodType: prefs.getString('bloodType') ?? '',
//       gender: prefs.getString('gender') ?? '',
//     );
//     return user;
//   }
//
//   Future<UserModel?> getUserData() async {
//     final email = _authRepo.firebaseUser.value?.email;
//     if (email != null) {
//       UserModel user = await getUserDataFromPrefs();
//       if (user.email.isEmpty) {
//         user = await _userRepo.getUserDetails(email);
//         await setUserData(user);
//       }
//       return user;
//     } else {
//       Get.snackbar('Error', 'Login to continue');
//     }
//     return null;
//   }
//
//   updateRecord(UserModel user) async {
//     await _userRepo.updateUserRecord(user);
//     await setUserData(user);
//   }
// }

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  getUserData(){
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null){
      return _userRepo.getUserDetails(email);
    }else{
      Get.snackbar('Error', 'Login to continue');
    }
  }


  updateRecord(UserModel user) async{
    await _userRepo.updateUserRecord(user);
  }
}