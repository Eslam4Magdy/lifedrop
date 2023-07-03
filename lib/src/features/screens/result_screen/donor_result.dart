import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lifedrop/src/constants/colors.dart';

class DonorResultPage extends StatelessWidget {
  final QuerySnapshot snapshot;

  const DonorResultPage(this.snapshot, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blackcolor,
        title: const Text('Search Results'),
      ),
      body: snapshot.size == 0
          ? const Center(
              child: Text(
                'No Results',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: snapshot.size,
              itemBuilder: (context, index) {
                var donor = snapshot.docs[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.grey[300],
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      title: Text(donor.get('FullName')),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Phone: ${donor.get('Phone')}'),
                          Text('City: ${donor.get('City')}'),
                          Text('Blood Type: ${donor.get('BloodType')}'),
                          Text('Age: ${donor.get('Age')}'),
                          Text('Gender: ${donor.get('Gender')}'),
                          Text('Last Donation: ${donor.get('LastDonation')} Months'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}