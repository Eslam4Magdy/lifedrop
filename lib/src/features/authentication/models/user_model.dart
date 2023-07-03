import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  final String? id;
  final String fullName;
  final String email;
  final String phoneNo;
  final String? city;
  final String? age;
  final String? lastDonation;
  final String? bloodType;
  final String? gender;
  final String? image;

  UserModel({
    this.id,
    this.city,
    this.age,
    this.lastDonation,
    this.bloodType,
    this.gender,
    this.image,
    required this.email,
    required this.fullName,
    required this.phoneNo,
  });

  toJson() {
    return {
      'FullName': fullName,
      'Email': email,
      'Phone': phoneNo,
      'City': city,
      'Age': age,
      'LastDonation': lastDonation,
      'BloodType': bloodType,
      'Gender': gender,
      'Image': image,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return UserModel(
      id: document.id,
      email: data['Email'],
      fullName: data['FullName'],
      phoneNo: data['Phone'],
      city: data['City'],
      age: data['Age'],
      lastDonation: data['LastDonation'],
      bloodType: data['BloodType'],
      gender: data['Gender'],
      image: data['Image'],
    );
  }
}
