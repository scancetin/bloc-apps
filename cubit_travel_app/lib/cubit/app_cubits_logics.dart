// ignore_for_file: prefer_const_constructors

import 'package:cubit_travel_app/cubit/app_cubits_cubit.dart';
import 'package:cubit_travel_app/views/detail_view.dart';
import 'package:cubit_travel_app/views/nav_views/home_view.dart';
import 'package:cubit_travel_app/views/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubitsLogics extends StatelessWidget {
  const AppCubitsLogics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, AppCubitsState>(builder: (context, state) {
        if (state is WelcomeState) {
          return WelcomeView();
        } else if (state is LoadedState) {
          return HomeView();
        } else if (state is LoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is DetailState) {
          return DetailView();
        } else {
          return CircularProgressIndicator();
        }
      }),
    );
  }
}
