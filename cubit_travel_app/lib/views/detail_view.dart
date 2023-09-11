// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:cubit_travel_app/cubit/app_cubits_cubit.dart';
import 'package:cubit_travel_app/widgets/custom_large_text.dart';
import 'package:cubit_travel_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, AppCubitsState>(
      builder: (context, state) {
        DetailState details = state as DetailState;
        return Scaffold(
          body: Container(
            height: double.maxFinite,
            width: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    width: double.maxFinite,
                    height: 350,
                    decoration: BoxDecoration(color: Colors.purpleAccent),
                  ),
                ),
                Positioned(
                  top: 300,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                    width: MediaQuery.of(context).size.width,
                    height: 600,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            LargeCustomText(text: details.place.location),
                            Spacer(),
                            LargeCustomText(
                                text: "\$ ${details.place.price}",
                                color: Colors.deepPurpleAccent),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.location_on_sharp,
                                color: Colors.deepPurpleAccent),
                            SizedBox(width: 5),
                            CustomText(
                                text: "USA, California",
                                color: Colors.deepPurpleAccent),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(
                                5,
                                (index) => index < 4
                                    ? Icon(Icons.star, color: Colors.orange)
                                    : Icon(Icons.star_border,
                                        color: Colors.black54),
                              ),
                            ),
                            SizedBox(width: 5),
                            CustomText(text: "(4.0)"),
                          ],
                        ),
                        SizedBox(height: 30),
                        LargeCustomText(text: "People", size: 20),
                        SizedBox(height: 5),
                        CustomText(
                            text: "Number of people in your group", size: 15),
                        SizedBox(height: 10),
                        Wrap(
                          children: List.generate(
                            5,
                            (index) {
                              return Container(
                                margin: EdgeInsets.only(right: 10),
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: index == 0
                                      ? Colors.black
                                      : Colors.purple[50],
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: CustomText(
                                    text: (index + 1).toString(),
                                    color: index == 0
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 30),
                        LargeCustomText(text: "Description", size: 20),
                        SizedBox(height: 5),
                        CustomText(
                          text: details.place.description,
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 1),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: IconButton(
                                icon: Icon(Icons.favorite_border),
                                onPressed: () {},
                              ),
                            ),
                            Container(
                              height: 60,
                              width: 250,
                              decoration: BoxDecoration(
                                color: Colors.deepPurpleAccent,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: IconButton(
                                icon: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CustomText(
                                        text: "Book Trip Now",
                                        color: Colors.white),
                                    Icon(Icons.fast_forward_rounded,
                                        color: Colors.white),
                                  ],
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 70,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () =>
                            BlocProvider.of<AppCubits>(context).homeView(),
                        icon: Icon(Icons.menu),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
