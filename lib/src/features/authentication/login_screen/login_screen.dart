// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:lifedrop/src/constants/images.dart';


import '../../../common_widget/header_widget.dart';
import '../../../constants/colors.dart';
import '../../../constants/size.dart';
import '../../../constants/texts.dart';
import 'login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: whitecolor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                HeaderWidget(
                  image: image2,
                  title: welcomeback,
                  subTitle: twelcomeback,
                ),
                SizedBox(height: defaultsize),
                LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
