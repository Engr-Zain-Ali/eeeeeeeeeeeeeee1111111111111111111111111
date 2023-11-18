
import 'package:flutter/material.dart';

import '../../my_colors.dart';
import '../shared/kkkk.dart';
import 'login_register_screen.dart';



class SiginUp_Screen extends StatefulWidget {
  const SiginUp_Screen({super.key});

  @override
  State<SiginUp_Screen> createState() => _SiginUp_ScreenState();
}

class _SiginUp_ScreenState extends State<SiginUp_Screen>with SingleTickerProviderStateMixin {

  final _formKey=GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController usernameController=TextEditingController();
  TextEditingController phonenumberController=TextEditingController();
  late AnimationController _controller;
  late Animation<double> _position;
  late Animation<double> _opacity;
  @override
  void dispose(){
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  @override
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

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: MyColors.myBlack,
              child: Stack(
                children: [
                  Positioned(
                   // bottom: -250,
                    child: Container(
                      width: size.width,
                      height: size.width + 550,
                      decoration: const BoxDecoration(
                          gradient: RadialGradient(radius: 0.65, colors: [
                            MyColors.myOrange,
                            MyColors.myBlack,
                          ])),
                    ),
                  ),
               Align(
                    alignment: Alignment.bottomCenter,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 70.0),
                                child: Container(
                                  child: Text(
                                    "Create an account",
                                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24,color: Colors.white),
                                  ),
                                ),
                              ),
                              Text(
                                  "Connect, Discover, Solve with Top Therapists!",
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,color: Colors.white,
                                  )
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(height: 10,),

                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  children: [

                                    Container(
                                      width: 312,
                                      height: 48,
                                      child: TextFormField(
                                        controller: usernameController,
                                        decoration: InputDecoration(
                                          //enabledBorder: InputBorder.none,
                                          //  focusedBorder: InputBorder.none,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                              color: Colors.brown,
                                            ),
                                          ),
                                          labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                          labelText: "Enter Your Name",
                                          //prefixIcon: Icon(Icons.email_outlined),//theek hy good...ok
                                        ),
                                        validator: (value){
                                          if(value!.isEmpty){
                                            return 'Enter your username';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),


                                    SizedBox(height: 28,),

                                    Container(
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
                                                color: Colors.brown,
                                              )),
                                          labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                          labelText: "Enter Your Email",
                                          //prefixIcon: Icon(Icons.email_outlined),
                                        ),
                                        validator: (value){
                                          if(value!.isEmpty){
                                            return 'Enter your email';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),

                                    SizedBox(height: 28,),
                                    Container(
                                      width: 312,
                                      height: 48,
                                      child: TextFormField(
                                        controller: passwordController,
                                        decoration: InputDecoration(
                                          // enabledBorder: InputBorder.none,
                                          //  focusedBorder: InputBorder.none,
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(15),
                                              borderSide: BorderSide(

                                                color: Colors.brown,
                                              )),
                                          labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                          labelText: "Enter Your Phone Number",
                                          // prefixIcon: Icon(Icons.lock_outlined),
                                        ),
                                        validator: (value){
                                          if(value!.isEmpty){
                                            return 'Enter your phone number';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 28,),
                                    Container(
                                      width: 312,
                                      height: 48,
                                      child: TextFormField(
                                        controller: passwordController,
                                        decoration: InputDecoration(

                                          // enabledBorder: InputBorder.none,
                                          //  focusedBorder: InputBorder.none,
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              borderSide: BorderSide(

                                                color: Colors.brown,
                                              )),
                                          labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                          labelText: "Enter Your Password",
                                          // prefixIcon: Icon(Icons.lock_outlined),
                                        ),
                                        validator: (value){
                                          if(value!.isEmpty){
                                            return 'Enter your password';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 31,
                                    ),
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
                                          child: Text('Register',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 36,
                                    ),
                                    Text("Or With",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    SizedBox(
                                      height: 20,
                                    ),
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
                                            //color: Colors.white,

                                            // width: 24,
                                            // height: 24,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 18.0),
                                              child: Image(
                                                color: Colors.white,
                                                image: AssetImage('assets/images/ff.png',),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 55,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 50.0),
                                            child: Text('Signup with Facebook',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,color: Colors.white
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 28,
                                    ),
                                    Container(

                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(color: Colors.black12)),
                                      width: 312,
                                      height: 48,
                                      child: Row(
                                        children: [
                                          Container(
                                            //width: 24,
                                            // height: 24,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 18.0),
                                              child: Image(

                                                image: AssetImage('assets/images/gg.png'),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 55,
                                          ),
                                          Text('Signup with Google',
                                              style: TextStyle(
                                                color: Colors.white,

                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              )),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('Don’t have an account?',style: TextStyle(color: Colors.white,fontSize: 16),),
                                        TextButton(
                                            onPressed: () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => LoginScreen())),
                                            child: Text("Login",
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
                  )
                ],
              ),
            ),

          ],
        ),
      ),

    );
  }

  void login() {}
}
