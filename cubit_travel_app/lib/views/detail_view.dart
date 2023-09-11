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
          body: SizedBox(
            height: double.maxFinite,
            width: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    width: double.maxFinite,
                    height: 350,
                    decoration: const BoxDecoration(color: Colors.purpleAccent),
                  ),
                ),
                Positioned(
                  top: 300,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 50),
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
                            const Spacer(),
                            LargeCustomText(
                                text: "\$ ${details.place.price}",
                                color: Colors.deepPurpleAccent),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Row(
                          children: [
                            Icon(Icons.location_on_sharp,
                                color: Colors.deepPurpleAccent),
                            SizedBox(width: 5),
                            CustomText(
                                text: "USA, California",
                                color: Colors.deepPurpleAccent),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(
                                5,
                                (index) => index < 4
                                    ? const Icon(Icons.star,
                                        color: Colors.orange)
                                    : const Icon(Icons.star_border,
                                        color: Colors.black54),
                              ),
                            ),
                            const SizedBox(width: 5),
                            const CustomText(text: "(4.0)"),
                          ],
                        ),
                        const SizedBox(height: 30),
                        const LargeCustomText(text: "People", size: 20),
                        const SizedBox(height: 5),
                        const CustomText(
                            text: "Number of people in your group", size: 15),
                        const SizedBox(height: 10),
                        Wrap(
                          children: List.generate(
                            5,
                            (index) {
                              return Container(
                                margin: const EdgeInsets.only(right: 10),
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
                        const SizedBox(height: 30),
                        const LargeCustomText(text: "Description", size: 20),
                        const SizedBox(height: 5),
                        CustomText(
                          text: details.place.description,
                        ),
                        const SizedBox(height: 30),
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
                                icon: const Icon(Icons.favorite_border),
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
                                icon: const Row(
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
                        icon: const Icon(Icons.menu),
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
