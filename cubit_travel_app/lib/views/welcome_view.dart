import 'package:cubit_travel_app/widgets/custom_large_text.dart';
import 'package:cubit_travel_app/widgets/custom_text.dart';
import 'package:cubit_travel_app/widgets/responsive_button.dart';
import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

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
            child: Container(
              margin: const EdgeInsets.only(top: 160, left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const LargeCustomText(text: "Welcome"),
                      const CustomText(text: "User", size: 30),
                      const SizedBox(height: 20),
                      SizedBox(
                          width: 250,
                          child: CustomText(text: loremIpsum(words: 13))),
                      const SizedBox(height: 20),
                      const ResponsiveButton(),
                    ],
                  ),
                  Column(
                    children: List.generate(
                      colors.length,
                      (dotIndex) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 2),
                          width: 8,
                          height: index == dotIndex ? 24 : 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: index == dotIndex
                                ? Colors.blueAccent
                                : Colors.grey,
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
