import 'package:flutter/material.dart';
import '../no_account_text.dart';
import 'components/sign_form.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";

  const SignInScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    "Welcome Back",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Sign in with your email and password  \nor continue with social media",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  const SignForm(),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.grey.withOpacity(.1),
                        child: Image(image: AssetImage('assets/images/gg.png')
                        ),
                      ),
            SizedBox(width: 20,),
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.grey.withOpacity(.1),
              child: Image(image: AssetImage('assets/images/ff.png')

                        ),
            ),
                      SizedBox(width: 20,),
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.grey.withOpacity(.1),
                        child: Image(image: AssetImage('assets/images/twitter.png')
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const NoAccountText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
