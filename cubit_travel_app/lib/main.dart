// ignore_for_file: prefer_const_constructors

import 'package:cubit_travel_app/cubit/app_cubits_cubit.dart';
import 'package:cubit_travel_app/cubit/app_cubits_logics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      // home: BottomNavBarView(),
      // home: DetailView(),
      home: BlocProvider(
        create: (context) => AppCubits(),
        child: AppCubitsLogics(),
      ),
    );
  }
}
