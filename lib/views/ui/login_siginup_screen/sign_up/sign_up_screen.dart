import 'package:flutter/material.dart';
import 'components/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";

  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
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
                  const Text("Complete Profile", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black
                  )),
                  const Text(
                    "Complete your details or continue \nwith social media",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  const SignUpForm(),
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
                        child: Image(image: AssetImage('assets/images/ff.png')
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'By continuing your confirm that you agree \nwith our Term and Condition',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
