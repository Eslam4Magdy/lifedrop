import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:get/get.dart';
import 'navbar_controller.dart';


class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyHomePageController controller = Get.put(MyHomePageController());

    return Scaffold(
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.black,
        items: const <Widget>[
          Icon(Icons.person, size: 30, color: Colors.white),
          Icon(Icons.search, size: 30, color: Colors.white),
          Icon(Icons.history, size: 30, color: Colors.white),
          Icon(Icons.question_mark, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          controller.selectedIndex.value = index;
        },
      ),
    );
  }
}





