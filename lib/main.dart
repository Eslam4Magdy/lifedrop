import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifedrop/src/constants/colors.dart';
import 'package:lifedrop/src/repository/authentication_repository/authentication_repository.dart';

Future<void> main() async{
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp()
  //     .then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: CircularProgressIndicator(color: redcolor3),
        ),
      ),
    );
  }
}
