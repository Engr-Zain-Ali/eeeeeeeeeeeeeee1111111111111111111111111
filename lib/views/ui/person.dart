import 'package:ecommmeranceeeee/views/shared/app_style.dart';
import 'package:flutter/material.dart';
class Person extends StatefulWidget {
  const Person({super.key});

  @override
  State<Person> createState() => _PersonState();
}

class _PersonState extends State<Person> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "This is the Person screen",style: appStyle(25, Colors.red, FontWeight.bold),
        ),
      ),
    );
  }
}
