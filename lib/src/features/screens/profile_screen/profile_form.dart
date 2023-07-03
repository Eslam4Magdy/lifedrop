import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lifedrop/src/constants/colors.dart';
import 'package:lifedrop/src/features/authentication/models/user_model.dart';
import 'package:lifedrop/src/features/screens/profile_screen/controller/profile_controller.dart';

import '../../../constants/texts.dart';
import '../../../styles/textformfield_style.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    final List<String> cities = [
      'Alexandria',
      'Aswan',
      'Asyut',
      'Beheira',
      'Beni Suef',
      'Cairo',
      'Dakahlia',
      'Damietta',
      'Faiyum',
      'Gharbia',
      'Giza',
      'Ismailia',
      'Kafr El Sheikh',
      'Luxor',
      'Matrouh',
      'Minya',
      'Monufia',
      'New Valley',
      'North Sinai',
      'Port Said',
      'Qalyubia',
      'Qena',
      'Red Sea',
      'Sharqia',
      'Sohag',
      'South Sinai',
      'Suez',
    ];
    return Form(
      child: FutureBuilder<UserModel>(
        future: controller.getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              UserModel userData = snapshot.data as UserModel;
              final TextEditingController fullNameController =
                  TextEditingController(text: userData.fullName);
              final TextEditingController emailController =
                  TextEditingController(text: userData.email);
              final TextEditingController phoneNoController =
                  TextEditingController(text: userData.phoneNo);
              final TextEditingController addressController =
                  TextEditingController(text: userData.city);
              final TextEditingController ageController =
                  TextEditingController(text: userData.age);
              final TextEditingController lastDonationController =
                  TextEditingController(text: userData.lastDonation);
              final TextEditingController bloodTypeController =
                  TextEditingController(text: userData.bloodType);
              final TextEditingController genderController =
                  TextEditingController(text: userData.gender);
              return Column(
                children: [
                  // Full Name
                  TextFormFieldStyle(
                    controller: fullNameController,
                    label: 'Full Name',
                    icon: Icons.person,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your full name.';
                      } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                        return 'Please enter only letters and spaces.';
                      }
                      return null; // Return null to indicate no validation errors
                    },
                  ),
                  // phone Number
                  TextFormFieldStyle(
                    textInputType: TextInputType.number,
                    controller: phoneNoController,
                    label: phonetxt,
                    icon: Icons.call,
                    textInputFormatter: [FilteringTextInputFormatter.allow(RegExp(r'^[0-9]+$')),],
                  ),
                  // City
                  DropdownSearch<String>(
                    items: cities,
                    popupProps: const PopupProps.menu(fit: FlexFit.loose),
                    dropdownDecoratorProps: const DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(100))),
                        labelText: "City",
                        labelStyle: TextStyle(
                          color: blackcolor,
                        ),
                        prefixIcon: Icon(Icons.location_city,color: blackcolor,),
                      ),
                    ),
                    onChanged: (value) {
                      addressController.text = value!;
                    },
                    selectedItem: addressController.text,
                  ).paddingOnly(left: 16, right: 16, bottom: 16),
                  // Age
                  TextFormFieldStyle(
                    textInputType: TextInputType.number,
                    controller: ageController,
                    label: age,
                    icon: Icons.person,
                    textInputFormatter: [FilteringTextInputFormatter.allow(RegExp(r'^[0-9]+$')),],
                  ),
                  // Last Donation
                  TextFormFieldStyle(
                    textInputType: TextInputType.number,
                    controller: lastDonationController,
                    label: lastDonation,
                    icon: Icons.timer,
                    textInputFormatter: [FilteringTextInputFormatter.allow(RegExp(r'^[0-9]+$')),],
                  ),
                  // Blood Type
                  DropdownSearch<String>(
                    items: const ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'],
                    dropdownDecoratorProps: const DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(100))),
                        labelText: "Blood Type",
                        labelStyle: TextStyle(
                          color: blackcolor,
                        ),
                        prefixIcon: Icon(Icons.bloodtype,color: blackcolor,),
                      ),
                    ),
                    onChanged: (value) {
                      bloodTypeController.text = value!;
                    },
                    selectedItem: bloodTypeController.text,
                  ).paddingOnly(left: 16, right: 16, bottom: 16),
                  // Gender
                  DropdownSearch<String>(
                    items: const ['Male' , 'Female'],
                    popupProps: const PopupProps.menu(fit: FlexFit.loose),
                    dropdownDecoratorProps: const DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(100))),
                        labelText: "Gender",
                        labelStyle: TextStyle(
                          color: blackcolor,
                        ),
                        prefixIcon: Icon(Icons.man,color: blackcolor,),
                      ),
                    ),
                    onChanged: (value) {
                      genderController.text = value!;
                    },
                    selectedItem: genderController.text,
                  ).paddingOnly(left: 16, right: 16, bottom: 16),
                  // Editing Button
                  SizedBox(
                    height: 50,
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () async {
                        UserModel updatedUser = UserModel(
                          id: userData.id,
                          email: emailController.text,
                          fullName: fullNameController.text,
                          phoneNo: phoneNoController.text,
                          city: addressController.text,
                          age: ageController.text,
                          lastDonation: lastDonationController.text,
                          bloodType: bloodTypeController.text,
                          gender: genderController.text,
                        );
                        await controller.updateRecord(updatedUser);
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: blackcolor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: const Text(
                        editProfile,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return const Center(
                child: Text('Something went wrong.'),
              );
            }
          } else {
            return const Center(child: CircularProgressIndicator(color: redcolor3,));
          }
        },
      ),
    );
  }
}
