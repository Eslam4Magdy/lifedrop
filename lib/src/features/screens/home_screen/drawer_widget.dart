// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lifedrop/src/constants/colors.dart';
// import 'package:lifedrop/src/features/screens/donation_screen/donation_screen.dart';
// import 'package:lifedrop/src/repository/authentication_repository/authentication_repository.dart';
//
// import '../../../constants/images.dart';
// import '../about_donation/about_donation.dart';
// import '../profile_screen/profile_screen.dart';
//
// class DrawerWidget extends StatelessWidget {
//   const DrawerWidget({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         children: [
//           // Profile Picture
//           const UserAccountsDrawerHeader(
//             decoration: BoxDecoration(
//               color: blackcolor // set the background color to red
//             ),
//             currentAccountPictureSize: Size(85, 85),
//             accountName: Text('Your Name'),
//             accountEmail: Text('your.email@example.com'),
//             currentAccountPicture: CircleAvatar(
//               backgroundImage: AssetImage(defaultProfileImage),
//             ),
//           ),
//           // Profile
//           ListTile(
//             leading: const Icon(Icons.person),
//             title: const Text('Profile'),
//             onTap: () {
//               Get.to(() => const ProfileScreen());
//             },
//           ),
//           // Old Donation
//           ListTile(
//             leading: const Icon(Icons.history),
//             title: const Text('Old Donation'),
//             onTap: () {
//               // Navigate to old donation screen
//               Get.to(() => const DonationPage());
//             },
//           ),
//           // About Donation
//           ListTile(
//             leading: const Icon(Icons.info),
//             title: const Text('About Donation'),
//             onTap: () {
//               // Navigate to about donation screen
//               Get.to(() => const AboutDonation());
//             },
//           ),
//           // LogOut
//           ListTile(
  //             leading: const Icon(Icons.logout),
//             title: const Text('Logout'),
//             onTap: () {
//               // Logout
//               AuthenticationRepository.instance.logout();
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
