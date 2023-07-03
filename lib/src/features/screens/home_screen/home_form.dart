import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lifedrop/src/constants/colors.dart';
import '../result_screen/bb_result.dart';
import '../result_screen/donor_result.dart';

class SearchForm extends StatelessWidget {
  SearchForm({Key? key}) : super(key: key);

  final RxString bloodType = ''.obs;
  final RxString selection = ''.obs;
  final RxString city = ''.obs;

  final List<String> _bloodTypes = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
  ];
  final List<String> _state = [
    'Blood Bank',
    'Donor',
  ];
  final List<String> _cities = [
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

  bool get isBloodBankSelected => selection.value == 'Blood Bank';

  void searchDonors() {
    FirebaseFirestore.instance
        .collection('users')
        .where('BloodType', isEqualTo: bloodType.value)
        .where('City', isEqualTo: city.value)
        .get()
        .then((QuerySnapshot snapshot) {
      Get.to(() => DonorResultPage(snapshot));
    });
  }

  void searchBloodBanks() {
    FirebaseFirestore.instance
        .collection('bloodbank')
        .where('city', isEqualTo: city.value)
        .get()
        .then((QuerySnapshot snapshot) {
      Get.to(() => BBResultPage(snapshot));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Status
            DropdownSearch<String>(
              items: _state,
              popupProps: const PopupProps.menu(fit: FlexFit.loose),
              dropdownDecoratorProps: const DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: "Status",
                  filled: true,
                ),
              ),
              onChanged: (value) {
                selection.value = value!;
              },
              selectedItem: selection.value,
            ),
            const SizedBox(height: 16.0),
            // City
            DropdownSearch<String>(
              items: _cities,
              popupProps: const PopupProps.menu(fit: FlexFit.loose),
              dropdownDecoratorProps: const DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: "City",
                  filled: true,
                ),
              ),
              onChanged: (value) {
                city.value = value!;
              },
              selectedItem: city.value,
            ),
            const SizedBox(height: 18.0),
            // Blood Type
            Obx(() {
              return Visibility(
                visible: selection.value == 'Donor',
                child: DropdownSearch<String>(
                  items: _bloodTypes,
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: "Blood Type",
                      filled: true,
                    ),
                  ),
                  onChanged: (value) {
                    bloodType.value = value!;
                  },
                  selectedItem: bloodType.value,
                ),
              );
            }),
            const SizedBox(height: 16.0),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (selection.value == 'Donor') {
                    searchDonors();
                  } else {
                    searchBloodBanks();
                  }
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: blackcolor,
                ),
                child: const Text('Search'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
