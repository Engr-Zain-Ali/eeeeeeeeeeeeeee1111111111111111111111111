import 'package:ecommmeranceeeee/views/shared/app_style.dart';
import 'package:flutter/material.dart';
class Shopping_Cart extends StatefulWidget {
  const Shopping_Cart({super.key});

  @override
  State<Shopping_Cart> createState() => _Shopping_CartState();
}

class _Shopping_CartState extends State<Shopping_Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "This is the Shoopy_Cart screen",style: appStyle(25, Colors.red, FontWeight.bold),
        ),
      ),
    );
  }
}
