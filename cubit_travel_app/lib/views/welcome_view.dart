// ignore_for_file: prefer_const_constructors

import 'package:cubit_travel_app/widgets/custom_large_text.dart';
import 'package:cubit_travel_app/widgets/custom_text.dart';
import 'package:cubit_travel_app/widgets/welcome_view/responsive_button.dart';
import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

import '../widgets/welcome_view/page_view_dots_widget.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [Colors.blue, Colors.lightGreen, Colors.deepPurple];

    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: colors.length,
        itemBuilder: (_, index) {
          return Container(
            height: double.maxFinite,
            width: double.maxFinite,
            decoration: BoxDecoration(color: colors[index]),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const LargeCustomText(text: "Welcome"),
                      const CustomText(text: "User", size: 30),
                      const SizedBox(height: 20),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: CustomText(text: loremIpsum(words: 13))),
                      const SizedBox(height: 20),
                      const ResponsiveButton(),
                    ],
                  ),
                  Column(
                    children: List.generate(
                      colors.length,
                      (dotIndex) =>
                          PageViewDotsWidget(isCurrent: index == dotIndex),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
