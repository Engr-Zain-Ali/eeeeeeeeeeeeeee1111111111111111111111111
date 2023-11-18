import 'package:ecommmeranceeeee/provider_statemanagement/main_screen_provider_pagechanger.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bottom_navigation_bar.dart';
class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
      builder: (context,mainScreenNotifier,child){
        return  SafeArea(
        child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        BottomNavBar_Widget(onTap: () {mainScreenNotifier.pageIndex=0;}, icon:mainScreenNotifier.pageIndex==0? Icons.home:Icons.home_outlined),
        BottomNavBar_Widget(onTap: () {mainScreenNotifier.pageIndex=1;}, icon:mainScreenNotifier.pageIndex==1? Icons.search:Icons.search_off_rounded),
        BottomNavBar_Widget(onTap: () {mainScreenNotifier.pageIndex=2;}, icon:mainScreenNotifier.pageIndex==2? Icons.add:Icons.add_card),
        BottomNavBar_Widget(onTap: () {mainScreenNotifier.pageIndex=3;}, icon: mainScreenNotifier.pageIndex==3?Icons.shopping_cart:Icons.shopping_cart_outlined),
        BottomNavBar_Widget(onTap: () {mainScreenNotifier.pageIndex=4;}, icon:mainScreenNotifier.pageIndex==4? Icons.person:Icons.person_outline),
        ],
        ),
        decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
        ),
        ),
        ),
        );
      },

    );
  }
}
