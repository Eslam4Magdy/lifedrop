import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lifedrop/src/features/authentication/models/user_model.dart';

import '../../../constants/colors.dart';
import '../../../constants/texts.dart';
import '../controllers/signup_controller.dart';
import '../login_screen/login_screen.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final formKey = GlobalKey<FormState>();
    final passwordVisible = false.obs;

    return Form(
      key: formKey,
      child: Column(
        children: [
          //Full Name
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Full Name',
              labelStyle: TextStyle(color: Colors.black),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              border: OutlineInputBorder(),
            ),
            controller: controller.fullName,
            validator: (value) {
              // Regular expression pattern to match letters and spaces only
              final RegExp regExp = RegExp(r'^[a-zA-Z\s]+$');
              if (value!.isEmpty) {
                return 'Please enter your full name.';
              } else if (!regExp.hasMatch(value)) {
                return 'Please enter only letters and spaces.';
              }
              return null; // Return null to indicate no validation errors
            },
          ),

          const SizedBox(height: 16),
          // Phone
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Phone Number',
              labelStyle: TextStyle(color: Colors.black),
              prefixIcon: Icon(
                Icons.phone,
                color: Colors.black,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              border: OutlineInputBorder(),
            ),
            controller: controller.phoneNo,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'^[0-9]+$')),
            ],
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your phone number.';
              }
              return null; // Return null to indicate no validation errors
            },
          ),
          const SizedBox(height: 16),
          // Email
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'Email Address',
              labelStyle: TextStyle(color: Colors.black),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.black,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              border: OutlineInputBorder(),
            ),
            controller: controller.email,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your email address.';
              } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(value)) {
                return 'Please enter a valid email address.';
              }
              return null; // Return null to indicate no validation errors
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
          const SizedBox(height: 20),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {

                  final user = UserModel(
                    fullName: controller.fullName.text.trim(),
                    email: controller.email.text.trim(),
                    phoneNo: controller.phoneNo.text.trim(),
                  );

                  SignUpController.instance.createUser(user);

                  SignUpController.instance.registerUser(
                      controller.email.text.trim(),
                      controller.password.text.trim());
                }
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: blackcolor,
              ),
              child: const Text(
                signuptxt,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                alreadyhaveaccount,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                child: const Text(
                  logintxt,
                  style: TextStyle(
                    color: blackcolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
