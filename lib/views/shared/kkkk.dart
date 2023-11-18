import 'package:ecommmeranceeeee/provider_statemanagement/main_screen_provider_pagechanger.dart';
import 'package:ecommmeranceeeee/views/shared/app_style.dart';
import 'package:ecommmeranceeeee/views/shared/bottom_nav_bar.dart';
import 'package:ecommmeranceeeee/views/shared/bottom_navigation_bar.dart';
import 'package:ecommmeranceeeee/views/ui/add.dart';
import 'package:ecommmeranceeeee/views/ui/home.dart';
import 'package:ecommmeranceeeee/views/ui/person.dart';
import 'package:ecommmeranceeeee/views/ui/shopping_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ui/search.dart';

class KKK extends StatefulWidget {
  const KKK({Key? key}) : super(key: key);

  @override
  State<KKK> createState() => _KKKState();
}

class _KKKState extends State<KKK> {
  List pageList = [
    Home(),
    Search(),
    Add(),
    Shopping_Cart(),
    Person(),
  ];

  @override
  Widget build(BuildContext context) {

    return Consumer<MainScreenNotifier>(
      builder: (context, mainScreenNotifier, child) {
        return Scaffold(
          body: pageList[mainScreenNotifier.pageIndex],
          bottomNavigationBar: BottomNavBar(),

        );
      },
    );
  }
}
