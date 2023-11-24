import 'package:ecommmeranceeeee/intro_screen.dart';
import 'package:ecommmeranceeeee/provider_statemanagement/main_screen_provider_pagechanger.dart';
import 'package:ecommmeranceeeee/views/CartPage.dart';
import 'package:ecommmeranceeeee/views/shared/kkkk.dart';
import 'package:ecommmeranceeeee/views/shared/product_provider.dart';
import 'package:ecommmeranceeeee/views/shared/show_all.dart';
import 'package:ecommmeranceeeee/views/ui/Shopping_Cart111.dart';
import 'package:ecommmeranceeeee/views/ui/components/profile_screen.dart';
import 'package:ecommmeranceeeee/views/ui/shopping_cart.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('cart_box');
  await Hive.openBox('fav_box');

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => MainScreenNotifier(),
    ),
    ChangeNotifierProvider(
      create: (context) => ProductNotifier(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(//kaha error hay?run hoegay...
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:IntroScreen(),
    );
  }
}
