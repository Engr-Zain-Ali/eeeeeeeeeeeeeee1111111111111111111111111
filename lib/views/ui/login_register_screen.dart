import 'package:flutter/material.dart';

import '../../my_colors.dart';
import '../shared/kkkk.dart';
import 'Siginup__screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late AnimationController _controller;
  late Animation<double> _position;
  late Animation<double> _opacity;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    _position = Tween<double>(begin: 20, end: 50).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0, 1)),
    )..addListener(() {
      setState(() {});
    });

    _opacity = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: Interval(.5, 1)),
    )..addListener(() {
      setState(() {});
    });

    _controller.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
     // backgroundColor: MyColors.myBlack, // Set background color here

      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                 // bottom: -450,
                  child: Container(
                    width: size.width,
                    height: size.width+700,
                    decoration: const BoxDecoration(
                        gradient: RadialGradient(radius: 0.85, colors: [
                          MyColors.myOrange,
                          MyColors.myBlack,
                        ])),
                  ),
                ),
                Align(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 134.0, right: 42, left: 64),
                              child: Container(
                                child: Text(
                                  "Hi, Welcome Back! 👋",
                                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24, color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 290.0),
                              child: Text(
                                "Email",
                                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300, color: Colors.white),
                              ),
                            ),
                            SizedBox(height: 6,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      // color: Colors.grey.withOpacity(.1),
                                      // borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Container(
                                      width: 312,
                                      height: 48,
                                      child: TextFormField(
                                        controller: emailController,
                                        decoration: InputDecoration(
                                          //enabledBorder: InputBorder.none,
                                          //  focusedBorder: InputBorder.none,
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(15),
                                              borderSide: BorderSide(
                                                color: Colors.white,
                                              )),
                                          labelText: "example@gmail.com",
                                          labelStyle: TextStyle(color: Colors.white),
                                          prefixIcon: Icon(Icons.email_outlined, color: Colors.white,),
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Enter your email';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 266.0),
                                    child: Text(
                                      "Password",
                                      style: TextStyle(fontSize: 13, color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Container(
                                    width: 312,
                                    height: 48,
                                    child: TextFormField(
                                      controller: passwordController,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          borderSide: BorderSide(
                                            color: Colors.blueAccent,
                                          ),
                                        ),
                                        labelText: "Enter Your Password",
                                        labelStyle: TextStyle(color: Colors.white),
                                        prefixIcon: Icon(Icons.lock_outlined, color: Colors.white),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Enter your password';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 18.0, top: 20),
                                        child: Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 7.0, top: 20),
                                        child: Text('Remember Me', style: TextStyle(color: Colors.white)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 47.0, top: 20),
                                        child: TextButton(onPressed: () {}, child: Text("Forgot Password?", style: TextStyle(color: Color(0xfff3896B4)))),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 28,),
                                  InkWell(
                                    onTap: () {
                                      if (_formKey.currentState!.validate()) {
                                        login();
                                      }
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => KKK()));
                                    },
                                    child: Container(
                                      width: 312,
                                      height: 48,
                                      decoration: BoxDecoration(
                                        color: Color(0xff3896B4),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text('Login',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 28,),
                                  Row(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 140),
                                      child: Text("Or With",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                  ],),
                                  SizedBox(height: 19,),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.black,
                                    ),
                                    width: 312,
                                    height: 48,
                                    child: Row(
                                      children: [
                                        Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 12.0),
                                            child: Image(
                                              color: Colors.white,
                                              image: AssetImage('assets/images/ff.png',),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 59,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right:1),
                                          child: Text('Login with Facebook',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,color: Colors.white,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.brown)),
                                    width: 312,
                                    height: 48,
                                    child: Row(
                                      children: [
                                        Container(

                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 12.0),
                                            child: Image(

                                              image: AssetImage('assets/images/gg.png'),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 60,
                                        ),
                                        Text('Login with Google',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Don’t have an account?', style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold)),
                                      TextButton(
                                          onPressed: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => SiginUp_Screen())),
                                          child: Text("Signup",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xfff40Bfff)))),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void login() {
    // Implement your login logic here
  }
}
