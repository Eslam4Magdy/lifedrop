import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../constants/colors.dart';

class DonationPage extends StatefulWidget {
  const DonationPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DonationPageState createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donation History'),
        centerTitle: true,
        backgroundColor: blackcolor,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('donations')
            .where('email', isEqualTo: user!.email)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text(
                'No Results',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            );
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              final donationData = document.data() as Map<String, dynamic>;
              final donationTitle = donationData['bloodbank'];
              final donationDate = donationData['date'];
              final donationReport = donationData['report'];
              final donationState = donationData['state'];
              final donationType = donationData['type'];
              final donationDescription = donationData['description'];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.grey[300],
                  child: ListTile(
                    title: Text(donationTitle),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Donation Date: $donationDate'),
                        Text('Description: $donationDescription'),
                        Text('Report: $donationReport'),
                        Text('State: $donationState'),
                        Text('Type: $donationType'),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
