import 'package:flutter/material.dart';
import 'package:lifedrop/src/constants/colors.dart';
import 'package:lifedrop/src/features/screens/profile_screen/profile_form.dart';
import 'package:lifedrop/src/features/screens/profile_screen/profile_image.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blackcolor,
        centerTitle: true,
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Logout
              AuthenticationRepository.instance.logout();
            },
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 15),
              ProfileImage(),
              SizedBox(height: 30),
              ProfileForm(),
            ],
          ),
        ),
      ),
    );
  }
}
