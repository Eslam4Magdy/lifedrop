import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/size.dart';
import '../../../constants/texts.dart';
import '../controllers/signin_controller.dart';
import '../forget_password/forget_password_options/option_button_widget.dart';
import '../register_screen/register_screen.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(SignInController());
    final formKey = GlobalKey<FormState>();
    final passwordVisible = false.obs;

    return Form(
      key: formKey,
      child: Column(
        children: [
          // Email
          TextFormField(
            decoration: const InputDecoration(
              labelText: emailtxt,
              labelStyle: TextStyle(color: blackcolor),
              prefixIcon: Icon(
                Icons.email,
                color: blackcolor,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: blackcolor),
              ),
              border: OutlineInputBorder(),
            ),
            controller: controller.email,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              // Add additional email validation if necessary
              return null;
            },
          ),
          const SizedBox(height: 16),
          // Password
          Obx(() => TextFormField(
            obscureText: !passwordVisible.value, // Toggle password visibility
            decoration: InputDecoration(
              labelText: passwordtxt,
              labelStyle: const TextStyle(color: blackcolor),
              prefixIcon: const Icon(
                Icons.lock,
                color: blackcolor,
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  passwordVisible.toggle(); // Toggle the value of passwordVisible
                },
                child: Icon(
                  passwordVisible.value
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: blackcolor,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: blackcolor),
              ),
              border: const OutlineInputBorder(),
            ),
            controller: controller.password,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              // Add additional password validation if necessary
              return null;
            },
          )),
          // Forget Password Button
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  builder: (context) => Container(
                    padding: const EdgeInsets.all(defaultsize),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          forgetpasswordtitle,
                          style: TextStyle(fontSize: defaultfontsize),
                        ),
                        const Text(
                          forgetpasswordsubtitle,
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        ForgetPasswordBtnWidget(
                          onTap: () {},
                          btnIcon: Icons.mail_outline_rounded,
                          title: emailtxt,
                          subTitle: resetviaemail,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        ForgetPasswordBtnWidget(
                          onTap: () {},
                          btnIcon: Icons.mobile_friendly_rounded,
                          title: phonetxt,
                          subTitle: resetviaphone,
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: const Text(
                forgetpassword,
                style: TextStyle(color: blackcolor),
              ),
            ),
          ),
          // LOGIN Button
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  SignInController.instance.loginUser(
                      controller.email.text.trim(),
                      controller.password.text.trim(),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: blackcolor,
              ),
              child: const Text(
                logintxt,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          // Don't have an Account
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                donthaveaccount,
              ),
              TextButton(
                onPressed: () {
                  Get.to(() => const RegisterScreen());
                },
                child: const Text(
                  signuptxt,
                  style:
                      TextStyle(color: blackcolor, fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
