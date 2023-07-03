import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lifedrop/src/constants/colors.dart';

class BBResultPage extends StatelessWidget {
  final QuerySnapshot snapshot;

  const BBResultPage(this.snapshot, {Key? key}) : super(key: key);

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
          var bloodBank = snapshot.docs[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.grey[300],
              child: ListTile(
                title: Text(bloodBank.get('name')),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Email: ${bloodBank.get('email')}'),
                    Text('Phone: ${bloodBank.get('phone')}'),
                    Text('Address: ${bloodBank.get('address')}'),
                    Text('City: ${bloodBank.get('city')}'),
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