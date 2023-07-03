import 'package:flutter/material.dart';
import 'package:lifedrop/src/constants/colors.dart';
import 'home_form.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blackcolor,
        title: const Text('Search'),
        centerTitle: true,
      ),
      //drawer: const DrawerWidget(),
      body: SearchForm(),
    );
  }
}