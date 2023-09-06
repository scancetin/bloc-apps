// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:cubit_travel_app/widgets/custom_large_text.dart';
import 'package:cubit_travel_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
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
                  children: [
                    Row(
                      children: [
                        LargeCustomText(text: "Yosemite"),
                        Spacer(),
                        LargeCustomText(
                            text: "\$ 250", color: Colors.deepPurpleAccent),
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
                    onPressed: () {},
                    icon: Icon(Icons.menu),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
