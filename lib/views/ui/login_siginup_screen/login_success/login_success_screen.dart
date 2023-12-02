import 'package:ecommmeranceeeee/views/shared/app_style.dart';
import 'package:flutter/material.dart';

import '../sign_in/sign_in_screen.dart';

class LoginSuccessScreen extends StatelessWidget {
  static String routeName = "/login_success";

  const LoginSuccessScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: const Text("Purchase Now"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Container(

            child: Image(image:AssetImage(
              "assets/images/success.png",
               //40%
            ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Purchase Successfuly",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              style: ButtonStyle(
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen()));
              },
              child: const Text("Back to home"),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
