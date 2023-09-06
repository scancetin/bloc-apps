// ignore_for_file: prefer_const_constructors

import 'package:cubit_travel_app/views/detail_view.dart';
import 'package:cubit_travel_app/views/nav_views/bottom_nav_bar_view.dart';
import 'package:cubit_travel_app/views/welcome_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      // home: BottomNavBarView(),
      home: DetailView(),
      // home: WelcomeView(),
    );
  }
}
