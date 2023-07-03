import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifedrop/src/constants/colors.dart';
import 'package:lifedrop/src/constants/images.dart';
import 'package:lifedrop/src/constants/texts.dart';

import '../../../constants/size.dart';
import '../../authentication/login_screen/login_screen.dart';
import '../../authentication/register_screen/register_screen.dart';

class WelcomScreen extends StatelessWidget {
  const WelcomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: whitecolor,
      body: Padding(
        padding: const EdgeInsets.all(defaultsize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: const AssetImage(image5),
              height: height * 0.6,
            ),
            // Welcome Text
            const Column(
              children: [
                Text(
                  welcomtxt,
                  style: TextStyle(
                      fontSize: defaultfontsize,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  welcomtxt2,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ],
            ),
            // LOGIN && SIGN UP Button
            Row(
              children: [
                // LOGIN Button
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Get.to(() => const LoginScreen());
                    },
                    style: OutlinedButton.styleFrom(
                        shape: const RoundedRectangleBorder(),
                        foregroundColor: blackcolor,
                        side: const BorderSide(),
                        padding:
                            const EdgeInsets.symmetric(vertical: defaultsize)),
                    child: const Text(
                      logintxt,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                // SIGN UP Button
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => const RegisterScreen());
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: const RoundedRectangleBorder(),
                        foregroundColor: whitecolor,
                        backgroundColor: redcolor3,
                        side: const BorderSide(),
                        padding:
                            const EdgeInsets.symmetric(vertical: defaultsize)),
                    child: const Text(
                      signuptxt,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
