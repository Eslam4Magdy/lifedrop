import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../features/navigation_bar/nav_bar.dart';
import '../../features/screens/welcom_screen/welcom_screen.dart';
import 'exception/signup_email_password_failure.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const WelcomScreen())
        : Get.offAll(() => const NavBar());
  }

  Future createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('is_logged_in', true);
      firebaseUser.value != null
          ? Get.offAll(() => const NavBar())
          : Get.to(() => const WelcomScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    } catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure();
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

  Future loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('is_logged_in', true);
      firebaseUser.value != null
          ? Get.offAll(() => const NavBar())
          : Get.to(() => const WelcomScreen());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  Future logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('is_logged_in', false);
    await _auth.signOut();
  }
}