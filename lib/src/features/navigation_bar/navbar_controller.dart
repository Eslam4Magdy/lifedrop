import 'package:get/get.dart';
import 'package:lifedrop/src/features/screens/donation_screen/donation_screen.dart';
import '../screens/about_donation/about_donation.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/profile_screen/profile_screen.dart';

class MyHomePageController extends GetxController {
  var selectedIndex = 0.obs;

  final screens = [
    const ProfileScreen(),
    const SearchScreen(),
    const DonationPage(),
    const AboutDonation()
  ];
}