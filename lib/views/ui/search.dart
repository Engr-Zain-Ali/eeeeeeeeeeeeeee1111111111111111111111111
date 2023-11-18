import 'package:ecommmeranceeeee/views/shared/app_style.dart';
import 'package:flutter/material.dart';
class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "This is the Search screen",style: appStyle(25, Colors.red, FontWeight.bold),
        ),
      ),
    );
  }
}
