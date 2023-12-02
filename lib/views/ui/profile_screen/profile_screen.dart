import 'package:ecommmeranceeeee/views/ui/profile_screen/profile_menu.dart';
import 'package:ecommmeranceeeee/views/ui/profile_screen/profile_pic.dart';
import 'package:flutter/material.dart';


class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";

  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const ProfilePic(),
            const SizedBox(height: 20),
            ProfileMenu(
              text: "My Account",
              icon: "assets/images/Profile.png",
              press: () => {},
            ),
            ProfileMenu(
              text: "Notifications",
              icon: "assets/images/N.png",
              press: () {},
            ),
            ProfileMenu(
              text: "Settings",
              icon: "assets/images/Profile.png",
              press: () {},
            ),
            ProfileMenu(
              text: "Help Center",
              icon: "assets/images/Profile.png",
              press: () {},
            ),
            ProfileMenu(
              text: "Log Out",
              icon: "assets/images/Profile.png",
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
