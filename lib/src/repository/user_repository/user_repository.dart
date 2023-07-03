// ignore_for_file: body_might_complete_normally_catch_error

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lifedrop/src/features/authentication/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> createUser(UserModel user) async {
    await _db.collection('users').add(user.toJson()).whenComplete(() {
      Get.snackbar(
        "Success",
        'You account has been created.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.1),
        colorText: Colors.green,
      );
    }).catchError((error, stackTrace) {
      Get.snackbar(
        "Error",
        'Something went wrong. Try again',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
      );
      print('Error - $error');
    });
  }

  Future<UserModel> getUserDetails(String email) async {
    final snapshot =
        await _db.collection('users').where('Email', isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

  Future<void> updateUserRecord(UserModel user) async {
    final docRef = _db.collection('users').doc(user.id);
    final docSnapshot = await docRef.get();

    if (docSnapshot.exists) {
      await docRef.update(user.toJson()).then((_) {
        Get.snackbar(
          "Success",
          'Your profile has been updated.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.green,
        );
      }).catchError((error, stackTrace) {
        Get.snackbar(
          "Error",
          'Something went wrong. Try again',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red,
        );
        print('Error - $error');
      });
    } else {
      Get.snackbar(
        "Error",
        'Document not found.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
      );
      print('Error - Document not found');
    }
  }
}

