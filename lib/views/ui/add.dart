import 'package:ecommmeranceeeee/views/shared/app_style.dart';
import 'package:flutter/material.dart';
class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "This is the Add screen",style: appStyle(25, Colors.red, FontWeight.bold),
        ),
      ),
    );
  }
}
