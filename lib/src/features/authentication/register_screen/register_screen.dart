// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:lifedrop/src/common_widget/header_widget.dart';
import 'package:lifedrop/src/features/authentication/register_screen/register_form.dart';

import '../../../constants/colors.dart';
import '../../../constants/images.dart';
import '../../../constants/size.dart';
import '../../../constants/texts.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                  title: registertxt,
                  subTitle: registertxt2,
                ),
                SizedBox(height: defaultsize),
                RegisterForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
